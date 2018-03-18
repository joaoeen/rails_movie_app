class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end
    
    def show
      id = params[:id]
      @movie = Movie.find(id)
    end
    
    def new
        #default: render new template
    end
    
    def create
        @movie = Movie.create!(params.require(:movie).permit(:rating, :title, :release_date))
        flash[:notice] = "#{@movie.title} was successfully create."
        redirect_to movies_path
    end

    def edit
        @movie = Movie.find params[:id]
        
    end
    
    def update
        @movie = Movie.find params[:id]
        @movie.update_attributes!(params.require(:movie).permit(:rating, :title, :release_date))
        flash[:notice] = "#{@movie.title} was successfully update."
        redirect_to movies_path
    end
    
    def destroy
        @movie = Movie.find params[:id]
        @movie.destroy
        flash[:notice] = "#{@movie.title} was successfully deleted."
        redirect_to movies_path
    end
end
