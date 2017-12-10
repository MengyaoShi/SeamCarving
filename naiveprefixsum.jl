testArr = [r * c for r in 1:5, c in 1:5]

# This is the naive cumulative sum method
# It simply adds the previous sum with the next value
function prefixSum(inputArr)
	len = length(inputArr)
	outputArr = Array{Float64,1}(len)
	outputArr[1] = inputArr[1]
	for idx in 2:len
		outputArr[idx] = inputArr[idx] + outputArr[idx-1]
	end
	return outputArr
end

function prefixArray(matrix)
	# Create matrix of equal size
	dims = size(matrix)
	outputMatrix = Array{Float64,2}(dims[1],dims[2])

	for colNum in 1:dims[1]
		# Get a column
		column = Array{Float64,1}(dims[2])
		for row in 1:dims[2]
			column[row] = matrix[colNum,row]
		end
		
		# Compute and copy value to matrix
		sumCol = prefixSum(column)
		copy!(outputMatrix,1+((colNum-1)*dims[2]),sumCol,1)
	end
	println(outputMatrix)
	return outputMatrix
end

prefixArray(testArr)
