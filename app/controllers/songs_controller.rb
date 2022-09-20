class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show 
    @song = Song.find(params[:id])
  end 

  def new 
    @song = Song.new 
  end 

  def create 
    @song = Song.new(song_params)

    if @song.save 
      flash[:success] = "New Song successfully created!"
      redirect_to song_path(@song)
    else 
      flash.now[:error] = "New Song creation failed!"
      render :new 
    end  

  end 

  def edit 
    @song = Song.find(params[:id])
  end 

  def update 
    @song = Song.find(params[:id])

    if  @song.update(song_params)
        redirect_to @song
    else 
      render :edit 
    end 
  end 

  def destroy 
    @song = Song.find(params[:id])
    @song.destroy

    redirect_to root_path
  end 

  private 
    def song_params 
      params.require(:song).permit(:subject, :rhythm, :album_id)
    end 
end
