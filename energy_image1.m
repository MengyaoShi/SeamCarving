function energyImage1=energy_image1(im)
grayim=rgb2gray(im);
grayim=double(grayim);
[Gx, Gy]=imgradientxy(grayim);
energyImage1=abs(Gx)+abs(Gy);