class BookmarksController < ApplicationController
  before_action :set_list, only: [:create, :new]
  # before_action :fetch_movies, only: [:create, :new]

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = @list.bookmarks.build(bookmark_params)
    # raise
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Movie added to the list!'
    else
      # @bookmarks = @list.bookmarks
      # fetch_movies
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    # raise
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark deleted.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  # def fetch_movies
  #   response = HTTParty.get('https://tmdb.lewagon.com/movie/top_rated')
  #   @movies = response.parsed_response['results']
  # end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
