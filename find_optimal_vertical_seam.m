function verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMap)
[height,width]=size(cumulativeEnergyMap);
xLocation=height;
verticalSeam=zeros(1,height);
[minVal,yLocation]=min(cumulativeEnergyMap(height,:));
j=yLocation;
for i=height:-1:2
    verticalSeam(i)=j;
    if j==1
        [minVal, relative_j]=min([cumulativeEnergyMap(i-1,j) cumulativeEnergyMap(i-1, j+1)]);
        j=j+relative_j-1;
    elseif j==width
        [minVal, relative_j]=min([cumulativeEnergyMap(i-1, j) cumulativeEnergyMap(i-1,j-1)]);
        j=j-relative_j+1;
    else
        [minVal, relative_j]=min([cumulativeEnergyMap(i-1,j-1) cumulativeEnergyMap(i-1, j), cumulativeEnergyMap(i-1, j+1)]);
        j=j+relative_j-2;
    end
end
verticalSeam(1)=j;
        
        
