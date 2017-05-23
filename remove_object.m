function remove_object()
im_=imread('test5.jpg');
energy_=energy_image(im_);
[height, width,newEnergy_]=reweight_energy_matrix(im_, energy_);
[a, b]=Multiple_seam_carving_reduce_width(width, im_, newEnergy_);
imshowpair(im_,a,'montage');