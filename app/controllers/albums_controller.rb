class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
    @albums = current_user.albums
  end

  def show
      @album_tracks = Track.where(album_id: @album)
  end

  def new
    @album = Album.new
  end

  def edit
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = current_user.id
    if @album.save
        redirect_to @album, notice: 'Album was successfully created.'
    else
      render :new
    end
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: 'Album was successfully updated.'
    else
      ender :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_url, notice: 'Album was successfully destroyed.'
    head :no_content
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def album_params
      params.require(:album).permit(:artist_id, :title, :year, :genre_id, :user_id)
    end
end
