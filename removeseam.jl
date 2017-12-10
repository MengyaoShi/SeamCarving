testArr = [r * c for r in 6:-1:1, c in 3:-1:1]

# Selects and removes a seam from the array
function selectSeam(arr)
	# Select min seam from cumulativeEnergyMap
	# Find the first minimum
	(height, width)=size(arr)
	column = Array{Float64,1}(height)
	seam = Array{Int32,1}(width)
	for row in 1:height
		column[row] = arr[row]
	end
	min = minimum(column)
	columnMin = findfirst(column, min)
	seam[1] = columnMin

	# Now find the minimum from the next column
	neighbors = Array{Float64,1}(3)
	neighborIdx = Array{Int32,1}(3)
	for row in 2:width
		prevRow = seam[row-1]
		currMid = prevRow + height
		currMid = convert(Int32,currMid)
		seam[row] = currMid
		# Fix edge cases
		for neighbor in 1:3
			neighbors[neighbor] = arr[currMid+neighbor-2]
		end
		min = minimum(neighbors)
		columnMin = findfirst(column, min)
		seam[row] = currMid + columnMin-2
	end
	return seam
end

# Remove seams specified from arr
function removeSeam(arr,seam)
	# Convert to 1D array
	println(arr)
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
	for seam in seams
		seamArray = selectSeam(arr)
		arr = removeSeam(arr, seamArray)
	end
	print(arr)
end

removeSeams(testArr,1)
