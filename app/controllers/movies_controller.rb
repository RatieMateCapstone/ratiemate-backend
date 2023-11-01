class MoviesController < ApplicationController
    def index 
        movies = Movies.all 
        render json: movies
    end
    def create
        movie = Movies.create(movie_params)
        if movie.valid?
          render json: movie
        else
          render json: movie.errors, status: 422
        end
      end
    
      private
      def movie_params
        params.require(:movie).permit(:title, :genre, :image, :trailer, :rating, :description, :platform, :user_id)
      end
end
