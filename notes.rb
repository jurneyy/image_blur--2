image = Image.new([
  0[0, 0, 0, 0],
  1[0, 1, 0, 0],
   2[0, 0, 0, 1],
   3[0, 0, 0, 0]
])	0  1  2  3	

Using this two dimensional array, the object is to locate the 1's
and blur the 0s around it (top, left, right, bottom)

1st loop 

	Going to loop through our image data 

	find the ones 

	save the x, and y coordinates of the 1s we found into a mini array that we are going to put into our array of 1s

2nd loop 

	Loop through our array of ones and get each x, and y coordinates and change the top, right, left and bottom of our original image array 

	Try to identify when we are on the right, left, top, & bottom edge 


3rd 

	Print the image that has now been changed 








ones = []
@image.each_with_index do |row, y|
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

	if y != @information.length - 1
		@information[y+1][x] = 1
	end 
end 













	y = index 



	#collection types = array, hash table 