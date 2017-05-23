function [sizeI, sizeJ,energy]=reweight_energy_matrix(im,energyImage)
image(im);
H=imrect();
mask=H.createMask;
[I,J,K]=find(mask);
sizeI=max(I)-min(I);
sizeJ=max(J)-min(J);
for i=1:length(I)
    energyImage(I(i), J(i))=-1*max(max(energyImage))*0.1;
end
energy=energyImage;
end
