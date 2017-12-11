testArray = 4:19

function parentLeft(column, row, totalColumns)
	parentColumn = column + 1
	dist = 2^(column-1)
	neighborRow = row - dist
	return (parentColumn,neighborRow)
end

function blelloch(inputArray)
	# Phase 1: Reduce
	# Recursively add pairs of numbers
	# Store intermediate values in a 2d array, resize len first
	originalLen = length(inputArray)

	# Need log length + 1 columns
	columns = convert(Int64, ceil(log2(originalLen))) + 1
	len = 2^(columns - 1)

	# Copy original array into sumArray
	sumArray = Array{Float64,2}(len, columns)
	sumArray[:] = zero(Float64)
	copy!(sumArray, 1, inputArray, 1)

	# Reduction sum, keep intermediate values
	for colNum in 2:columns
		elemsInColumn = convert(Int64, ceil(len/(2^(colNum-1))))
		for elemIdx in 1:elemsInColumn
			rowNum = elemIdx*(2^(colNum-1))
			prevRowNum = rowNum-2^(colNum-2)
			sumArray[rowNum, colNum] = sumArray[rowNum, colNum-1] + sumArray[prevRowNum, colNum-1]
		end
	end
	#println(sumArray)

	# Phase 2: Downsweep
	# If even, copy parent node
	# If odd, bring down and add with parent node's left sibling
	# Here, I just add both since even nodes will add 0

	# Bring down intermediate values that need to be copied
	downsweepArray = Array{Float64,2}(len, columns)
	downsweepArray[:] = zero(Float64)
	for dsColumn in 1:columns
		startpt = 2^(dsColumn-1)
		increment = startpt*2
		for idx in startpt:increment:len
			downsweepArray[idx, dsColumn] = sumArray[idx, dsColumn]
		end
	end
	
	println(downsweepArray)
	
	# Begin downsweep
	for revDsColumn in (columns-1):-1:1
		increment = 2^(revDsColumn-1)
		start = 2*increment
		for idx in start:increment:len
			leftLocation = parentLeft(revDsColumn, idx, len)
			# Add the value of parent and parent's left sibling
			downsweepArray[idx, revDsColumn] += downsweepArray[idx, revDsColumn+1] + downsweepArray[leftLocation[2], leftLocation[1]]
		end
	end
	println(downsweepArray)

	# Now truncate the parts we don't need
	cumSum = downsweepArray[1:originalLen]
	println(cumSum)
	return cumSum
end

blelloch(testArray)
