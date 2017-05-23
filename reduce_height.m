function [reducedColorImage,reducedEnergyImage] = reduce_height(im,energyImage)
[height, width, color_dim]=size(im);
cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage,'HORIZONTAL');
horizontalSeam = find_optimal_horizontal_seam(cumulativeEnergyMap);
display_seam(im, horizontalSeam, 'HORIZONTAL');
reducedColorImage=uint8(zeros(height-1, width, 3));
reducedEnergyImage=zeros(height-1, width);
for j=1:width
    reducedColorImage(1:(horizontalSeam(j)-1),j,:)=im( 1:(horizontalSeam(j)-1),j,:);
    reducedColorImage(horizontalSeam(j):(height-1),j,:)=im((horizontalSeam(j)+1):height,j,:);
    reducedEnergyImage(1:(horizontalSeam(j)-1),j)=energyImage(1:(horizontalSeam(j)-1),j);
    reducedEnergyImage(horizontalSeam(j):(height-1),j)=energyImage((horizontalSeam(j)+1):height,j);
end

