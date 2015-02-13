class ChirpsController < ApplicationController

	def index
		@chirps = Chirp.all.order(created_at: :desc)

		render "index"
	end

	def show
		@chirp = Chirp.find(params[:id])

		render "edit"
	end

	def create
		Chirp.create(chirp: params[:chirp_text])

		redirect_to "/chirps"
	end

	def update
		if params[:delete_chirp]
			Chirp.find(params[:id]).destroy
		else
			Chirp.find(params[:id]).update_attributes(chirp: params[:chirp_text])
		end

		redirect_to "/chirps"
	end

end
