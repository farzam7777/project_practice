class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    
    if @movie.save
      redirect_to movie_path(@movie), notice: "Movie is successfuly Created. "
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie), notice: "Movie is successfuly Updated. "
    else
      render :edit
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
    @not_included_actors = Actor.all.where("id NOT IN (Select actor_id from appearences where movie_id = ?)", @movie.id)
  end

  def destroy
    @movie = Movie.find(params[:id])

    if @movie.destroy
      redirect_to movies_path, notice: "Movie is successfuly Deleted. "
    else
      redirect_to movie_path(@movie), notice: "Some Problem occured while Deleting. "
    end
  end

  def create_cast
    @movie = Movie.find(params[:id])
    @appearence = Appearence.create movie_id: params[:movie_id], actor_id: params[:actor_id]
    @actor = Actor.find(params[:actor_id])
    @not_included_actors = Actor.all.where("id NOT IN (Select actor_id from appearences where movie_id = ?)", @movie.id)

    respond_to do |format|
      if @appearence.save
        format.html { redirect_to movie_path(@movie), notice: "Cast is successfuly Updated. " }
        format.js
      else
        format.html { redirect_to movie_path(@movie), notice: "Some Problem occured while adding cast. " }
        format.js
      end
    end
  end

  def remove_cast
    @appearence = Appearence.where(movie_id: params[:id], actor_id: params[:actor_id]).select("id")
    @actor = params[:actor_id]
    respond_to do |format|
      if Appearence.destroy(@appearence)
        format.html { redirect_to movie_path(params[:id]), notice: "Actor is successfully removed. " }
        format.js
      else
        format.html { redirect_to movie_path(params[:id]), notice: "Actor is not successfully removed. " }
        format.js
      end
    end
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :description, :trailor)
    end
end
