function energyImage=energy_image(im)
grayim=rgb2gray(im);
grayim=double(grayim);
[Gx, Gy]=imgradientxy(grayim);
energyImage=sqrt(Gx.^2 + Gy.^2);


