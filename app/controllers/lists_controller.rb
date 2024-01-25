class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  def add_movie_to_list
    @list = List.find(params[:id])
    @movie_list = @list.bookmarks.build(movie_id: movie_list_params[:movie_id])

    if @movie_list.save
      redirect_to @list, notice: 'Movie added to the list successfully.'
    else
      render 'lists/show'
    end
  end
  def create_movies
    @list = List.find(params[:id])
    selected_movie_ids = params[:movie_ids] || []

    @list.movies << Movie.find(selected_movie_ids)

    redirect_to list_path(@list), notice: 'Movies added successfully.'
  end


  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :other_attributes)
  end

  def movie_list_params
    params.permit(:movie_id)
  end
end
