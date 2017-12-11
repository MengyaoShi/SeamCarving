using TestImages, Images, ImageView
img=testimage("lighthouse")
gray=convert(Image{Images.Gray}, img)
Gx_, Gy_=imgradients(gray, "sobel")
energy=sqrt(Gx_.^2+Gy_.^2)
(height, width)=size(energy)
cumulativeEnergyMap=energy
for j=2:width
        for i=1:height
            if i==1
                cumulativeEnergyMap[i,j]=cumulativeEnergyMap[i,j]+min(cumulativeEnergyMap[i, j-1], cumulativeEnergyMap[i+1, j-1])
            elseif i==height
                cumulativeEnergyMap[i,j]=cumulativeEnergyMap[i,j]+min(cumulativeEnergyMap[i, j-1], cumulativeEnergyMap[i-1, j-1])
            else
                cumulativeEnergyMap[i,j]=cumulativeEnergyMap[i,j]+min(cumulativeEnergyMap[i-1,j-1], cumulativeEnergyMap[i, j-1], cumulativeEnergyMap[i+1, j-1])
            end
        end
end
view(cumulativeEnergyMap)
