class AlbumsController < ApplicationController
  def new
    @band = Band.find(params[:band_id].to_i)
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_url
    end
  end

  def edit
  end

  def show
    @album = Album.find(params[:id])
    @band = @album.band
  end

  def destroy
  end

  def update
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :title, :studio)
  end
end
