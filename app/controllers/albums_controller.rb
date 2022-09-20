class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def show 
    @album = Album.find(params[:id])
  end 

  def new 
    @album = Album.new
  end 

  def create
    @album = Album.new(album_params)

    if @album.save 
      flash[:success] = "New Album successfully created!"
      redirect_to album_path(@album)
    else 
      flash.now[:error] = "New Album creation failed!"
      render :new 
    end  
  end 

  def edit 
    @album = Album.find(params[:id])
  end 

  def update 
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to @album 
    else 
      render :edit 
    end 
  end 

  def destroy 
    @album = Artist.find(params[:id]).albums.find(params[:id])
    @album.destroy

    redirect_to root_path
  end 

  def genre_sort
    if params[:search_by_genre] && params[:search_by_genre] != ""
      @songs = Song.joins(:album).where("genre LIKE ?", params[:search_by_genre]).joins(:rating).order("ratings.evaluation DESC")
    end  
  end 

  def year_sort
    if params[:search_by_year] && params[:search_by_year] != ""
      @songs = Song.joins(:album).where("release LIKE ?", params[:search_by_year])
    end  
  end 

  private 
    def album_params 
      params.require(:album).permit(:title, :genre, :release, :album_id, :artist_id)
    end 
end
