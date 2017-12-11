testArr = [r * c for r in 1:5, c in 1:4]

# Selects and removes a seam from the array
function selectSeam(arr)
	# Select min seam from cumulativeEnergyMap
	# Find the first minimum
	(height, width)=size(arr)
	column = Array{Float64,1}(height)
	seam = Array{Int32,1}(width)
	for row in 1:height
		column[row] = arr[row,width]
	end
	min = minimum(column)
	columnMin = findfirst(column, min)
	seam[width] = columnMin + (height * (width-1))

	# Now find the minimum from the next column
	top = 0
	bottom = 0

	neighborIdx = Array{Int32,1}(3)
	for row in (width-1):-1:1
		prevRow = seam[row+1]
		currMid = prevRow - height
		
		currMid = convert(Int32,currMid)
		# Fix edge cases
		if currMid % height == 1
			top = 1
			bottom = 0
			neighbors = Array{Float64,1}(2)
		elseif currMid % height == 0
			bottom = 1
			top = 0
			neighbors = Array{Float64,1}(2)
		else
			top = 0
			bottom = 0
			neighbors = Array{Float64,1}(3)
		end

		# Get the 3 neighbor values
		neighbors = Array{Float64,1}(3 - bottom - top)
		for neighbor in 1:length(neighbors)
			#println(currMid+neighbor-2+top)
			neighbors[neighbor] = arr[currMid+neighbor-2+top]
		end

		min = convert(Int32,minimum(neighbors))
		
		columnMin = findfirst(neighbors, min)
		seam[row] = currMid + columnMin-2+top
	end
	return seam
end

# Remove seams specified from arr
function removeSeam(arr,seam)
	# Convert to 1D array
	(height, width)=size(arr)
	oneDim = Array{Float64,1}(height*width)
	for idx in 1:(height*width)
		oneDim[idx] = arr[idx]
	end

	# Delete
	for pixelIdx in 1:length(seam)
		pixel = seam[pixelIdx]
		deleteat!(oneDim,(pixel+1-pixelIdx))
	end

	# Turn back into 2D
	arr = Array{Float64,2}(height-1,width)
	for idx in 1:((height-1)*width)
		arr[idx] = oneDim[idx]
	end
	return arr
end

function removeSeams(arr, seams)
	println("Initial array: ",arr)
	for seam in 1:seams
		seamArray = selectSeam(arr)
		#println(seamArray)
		arr = removeSeam(arr, seamArray)
	end
	println("Removed seams: ",arr)
end

removeSeams(testArr,3)
