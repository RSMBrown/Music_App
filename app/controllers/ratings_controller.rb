class RatingsController < ApplicationController

  def create 
    @song = Song.find(params[:song_id])
    @rating = @song.create_rating!(rating_params)
    
    if @rating.save
      flash[:success] = "New Rating successfully created!"
      redirect_to song_path(@song)
    else 
      flash.now[:error] = "New Rating creation failed!"
    end 
  end 

  private 
    def rating_params 
      params.require(:rating).permit(:evaluation)
    end 
end
