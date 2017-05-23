function horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMap)
[height,width]=size(cumulativeEnergyMap);
yLocation=width;
horizontalSeam=zeros(1,width);
[minVal,xLocation]=min(cumulativeEnergyMap(:,width));
i=xLocation;
for j=width:-1:2
    horizontalSeam(j)=i;
    if i==1
        [minVal, relative_i]=min([cumulativeEnergyMap(i,j-1) cumulativeEnergyMap(i+1, j-1)]);
        i=i+relative_i-1;
    elseif i==height
        [minVal, relative_i]=min([cumulativeEnergyMap(i, j-1) cumulativeEnergyMap(i-1,j-1)]);
        i=i-relative_i+1;
    else
        [minVal, relative_i]=min([cumulativeEnergyMap(i-1,j-1) cumulativeEnergyMap(i, j-1), cumulativeEnergyMap(i+1, j-1)]);
        i=i+relative_i-2;
    end
end
horizontalSeam(1)=i;
        
