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

  def add_movies
    @list = List.find(params[:id])
    @movies = Movie.all # Adjust based on your actual logic to fetch movies
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
end
