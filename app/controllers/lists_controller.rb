class ListsController < ApplicationController
  include HTTParty
  base_uri 'https://tmdb.lewagon.com'

  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    @movies = fetch_movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_strong_params)
    if @list.save
      redirect_to @list
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_strong_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def fetch_movies
    response = self.class.get('/movie/top_rated')
    @movies = response.parsed_response['results']
  end
end
