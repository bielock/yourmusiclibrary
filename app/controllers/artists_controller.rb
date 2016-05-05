class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = current_user.artists
  end

  def show
    @artist_albums = Album.where(artist_id: @artist)
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user_id = current_user.id

      if @artist.save
        redirect_to @artist, notice: 'Artist was successfully created.'
      else
        render :new 
      end
  end

  def update
      if @artist.update(artist_params)
        redirect_to @artist, notice: 'Artist was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @artist.destroy
      redirect_to artists_url, notice: 'Artist was successfully destroyed.'
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end
end
