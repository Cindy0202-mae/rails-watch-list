class ListsController < ApplicationController
  include HTTParty
  base_uri 'https://tmdb.lewagon.com'

  before_action :set_list, only: [:show, :destroy]

  def index
    if params[:search] && params[:search][:query].present?
      @lists = List.where('name ILIKE ?', "%#{params[:search][:query]}%")
    else
      @lists = List.all
    end
  end

  def show
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_strong_params)
    if @list.save
      redirect_to lists_path, notice: 'List created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'List deleted successfully!'
  end

  private

  def list_strong_params
    params.require(:list).permit(:name, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end

  # def fetch_movies
  #   response = self.class.get('/movie/top_rated')
  #   @movies = response.parsed_response['results']
  # end
end
