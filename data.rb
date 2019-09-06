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

	def top(x, y, n)
		@information[y-n][x] = 1
	end 

	def right(x, y, n)
		@information[y][x+n] = 1
	end 

	def left(x, y, n)
		@information[y][x-n] = 1
	end 

	def bottom(x, y, n)
		@information[y+n][x] = 1
	end 


	def blur(x, y, n=1)

		while n > 0 

			if y != 0
				top(x, y, n)
			end 

			if x != 0
				left(x, y, n)
			end

			if x != @information[y].length - 1
				right(x, y, n)
			end

			if y != @information.length - 1
				bottom(x, y, n)
			end 

			n = n - 1
		end 
	end 

	def blur_image_manhattan(n)
		ones = []
		@information.each_with_index do |row, y|
			row.each_with_index do |col, x|
				if col == 1 
					ones.push([y,x])
				end
			end
		end 
			@information.each_with_index do |row, y|
				row.each_with_index do |col, x|
					ones.each do |point|
					distance = manhattan_distance(x, y, point[1], point[0], n)

					if distance
						@information[y][x] = 1
					end
				end 
			end
		end 
	end 

	def manhattan_distance(x1, y1, x2, y2, n)
		return (x1 - x2).abs + (y1 - y2).abs <= n
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
			blur(x, y)
		end 
	end 
end 


image = Image.new([
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]
])

#image.output_image
#puts "\n"
image.blur_image_manhattan(3)
image.output_image





