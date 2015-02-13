class ChirpsController < ApplicationController

	def index
		@chirps = Chirp.all

		#Render the index template
	end

	def show
		@chirp = #Pull a specific chirp here based on the ID parameter Hint: params[:id]

		#Render the edit template
	end

	def create
		#Create a new chirp here with the chirp_text parameter Hint: params[:chirp_text]

		redirect_to "/chirps"
	end

	def update
		if params[:delete_chirp]
			#Delete a chirp based on its ID Hint: params[:id]
		else
			#Try to update a chirp based on the chirp ID and the chirp_text parameters Hint: params[:id] and params[:chirp_text]
		end

		redirect_to "/chirps"
	end

end
