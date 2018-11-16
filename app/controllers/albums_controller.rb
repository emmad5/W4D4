class AlbumsController < ApplicationController

  def new
    @band_id = params[:band_id]
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create
    album = album.new(album_params)
    if album.save
      redirect_to album_url(album)
    else
      flash[:errors] = ['Invalid Album']
      redirect_to new_band_album_url(album.band_id)
    end
  end

  def index
    @albums = Album.all
    render :index
  end

  def edit
    @band_id = params[:band_id]
    @bands = Band.all
    @album = Album.find(params[:id])
  end

  def show
  end

  def update
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to albums_url
  end

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :studio)
  end
end
