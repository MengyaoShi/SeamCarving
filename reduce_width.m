function [reducedColorImage,reducedEnergyImage] = reduce_width(im,energyImage)
[height, width, color_dim]=size(im);
cumulativeEnergyMap = cumulative_minimum_energy_map(energyImage,'VERTICAL');
verticalSeam = find_optimal_vertical_seam(cumulativeEnergyMap);
%%display_seam(im, verticalSeam, 'VERTICAL');
reducedColorImage=uint8(zeros(height, width-1, 3));
reducedEnergyImage=zeros(height, width-1);
for i=1:height
    reducedColorImage(i,1:(verticalSeam(i)-1),:)=im(i, 1:(verticalSeam(i)-1),:);
    reducedColorImage(i, verticalSeam(i):(width-1),:)=im(i, (verticalSeam(i)+1):width,:);
    reducedEnergyImage(i, 1:(verticalSeam(i)-1))=energyImage(i, 1:(verticalSeam(i)-1));
    reducedEnergyImage(i, verticalSeam(i):(width-1))=energyImage(i, (verticalSeam(i)+1):width);
end

