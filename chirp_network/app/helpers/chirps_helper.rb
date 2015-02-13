module ChirpsHelper

	def random_bird
		bird = rand(1..4).to_s

		return "/assets/birds/bird" + bird + ".png"
	end

end
