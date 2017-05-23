function cumulativeEnergyMap =cumulative_minimum_energy_map(energyImage,seamDirection)
[height,width]=size(energyImage);
cumulativeEnergyMap=energyImage;
if strcmp(seamDirection,'VERTICAL')
    for i=2:height
        for j=1:width
            if j==1
                cumulativeEnergyMap(i,j)=cumulativeEnergyMap(i,j)+min([cumulativeEnergyMap(i-1,j) cumulativeEnergyMap(i-1,j+1)]);
            elseif j==width
                cumulativeEnergyMap(i,j)=cumulativeEnergyMap(i,j)+min([cumulativeEnergyMap(i-1,j) cumulativeEnergyMap(i-1,j-1)]);
            else
                cumulativeEnergyMap(i,j)=cumulativeEnergyMap(i,j)+min([cumulativeEnergyMap(i-1,j-1) cumulativeEnergyMap(i-1,j) cumulativeEnergyMap(i-1,j+1)]);
            end
        end
    end
elseif strcmp(seamDirection,'HORIZONTAL')
    for j=2:width
        for i=1:height
            if i==1
                cumulativeEnergyMap(i,j)=cumulativeEnergyMap(i,j)+min([cumulativeEnergyMap(i, j-1) cumulativeEnergyMap(i+1, j-1)]);
            elseif i==height
                cumulativeEnergyMap(i,j)=cumulativeEnergyMap(i,j)+min([cumulativeEnergyMap(i, j-1) cumulativeEnergyMap(i-1, j-1)]);
            else
                cumulativeEnergyMap(i,j)=cumulativeEnergyMap(i,j)+min([cumulativeEnergyMap(i-1,j-1) cumulativeEnergyMap(i, j-1) cumulativeEnergyMap(i+1, j-1)]);
            end
        end
    end
else
    msgbox('second input has to be VERTICAL or HORIZONTAL');
end


    