class MoviesController < ApplicationController
    def index 
        movies = Movie.all 
        render json: movies
    end
def create
  @movie = Movie.new(movie_params)
  if @movie.save
    render json: @movie, status: :created, location: @movie
  else
    render json: @movie.errors, status: :unprocessable_entity
  end
end
    def update
        edit_movie = Movie.find(params[:id])
        edit_movie.update(movie_params)
        if edit_movie.valid?
          render json: edit_movie
        else
          render json: edit_movie.errors, status: 422
        end
      end

      def destroy
        delete_movie = Movie.find(params[:id])
        movies = Movie.all
        if delete_movie.destroy
          render json: movies, status: 204
        else
          render json: delete_movie.errors
        end
      end
    
      private
      def movie_params
        params.require(:movie).permit(:title, :genre, :image, :trailer, :rating, :description, :platform, :user_id)
      end
end
