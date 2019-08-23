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

	def blur_image
		ones = []
		@information.each_with_index do |row, y|
			row.each_with_index do |col, x|
				if col == 1 
					ones.push([y,x])
				end
			end
		end 
		ones.each do |inner|
			x = inner[1]
			y = inner[0]

			if y != 0
				@information[y-1][x] = 1
			end 

			if x != 0
				@information[y][x-1] = 1
			end

			if x != @information[y].length - 1
				@information[y][x+1] = 1
			end

			if y != @information.length - 1
				@information[y+1][x] = 1
			end 
		end 
	end 
end 


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

#image.output_image
#puts "\n"
image.blur_image
image.output_image





