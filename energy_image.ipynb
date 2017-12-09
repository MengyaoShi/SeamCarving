using TestImages, Images, ImageView
img=testimage("lighthouse")
gray=convert(Image{Images.Gray}, img)
Gx_, Gy_=imgradients(gray, "sobel")
energy=sqrt(Gx_.^2+Gy_.^2)
(height, width)=size(energy)
cumulativeEnergyMap=energy
for i=2:height
        for j=1:width
            if j==1
                cumulativeEnergyMap[i,j]=cumulativeEnergyMap[i,j]+min(cumulativeEnergyMap[i-1,j], cumulativeEnergyMap[i-1,j+1])
            elseif j==width
                cumulativeEnergyMap[i,j]=cumulativeEnergyMap[i,j]+min(cumulativeEnergyMap[i-1,j], cumulativeEnergyMap[i-1,j-1])
            else
                cumulativeEnergyMap[i,j]=cumulativeEnergyMap[i,j]+min(cumulativeEnergyMap[i-1,j-1], cumulativeEnergyMap[i-1,j], cumulativeEnergyMap[i-1,j+1])
            end
        end
end
view(cumulativeEnergyMap)
