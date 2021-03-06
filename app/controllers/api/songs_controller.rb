class Api::SongsController < ApplicationController
	before_action :set_song, only: [:show, :update, :destroy, :resources, :collections]
	
	def index
		@songs = Song.all.sort { |a,b| a.title <=> b.title }
		respond_to do |f|
			f.html { render 'songs/index' }
			f.json { render json: @songs }
		end
	end
	
	def show
		render json: @song
	end

	def create
		@song = Song.new(song_params)
		if @song.save
			render json: @song
		else
			render json: { errors: { message: 'song NOT created' }}
		end
	end

	def update
		@song.update(song_params)
		if @song.save
			render json: @song
		else
			render json: { errors: { message: 'song NOT updated' }}
		end
	end

	def destroy
		@song.delete
		render json: { message: 'song deleted' }
	end
	
	def resources
		@resources = @song.resources
		if @resources
			render json: @resources
		else
			render json: { errors: { message: 'song resources NOT found' }}
		end
	end
	
	def collections
		@collections = @song.collections
		if @collections
			render json: @collections
		else
			render json: { errors: { message: 'song collections NOT found' }}
		end
	end

	private
	def set_song
		@song = Song.find_by_id(params[:id])
		end
	def song_params
		params.require(:song).permit(:title)
	end
end
