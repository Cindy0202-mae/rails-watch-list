class BookmarksController < ApplicationController
  before_action :set_list, only: [:create]

  # def new
  #   @bookmark = Bookmark.new
  # end

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    # raise
    if @bookmark.save
      redirect_to list_path(@list)
    else
      # @bookmarks = @list.bookmarks
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    # raise
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark was successfully deleted.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
