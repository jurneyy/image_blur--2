class Image 

	def initialize(data)

		@information = data
	end

	def output_image

		@information.each do |x|

			print x.join("")
			print "\n"
		end
	end
end 

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

image.output_image