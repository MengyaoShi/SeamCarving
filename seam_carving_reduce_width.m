im_=imread('LogSpiral.png');
energy_=energy_image(im_);
%%energy_=energy_image1(im_);
[a, b]=Multiple_seam_carving_reduce_width(200, im_, energy_);
imshowpair(im_,a,'montage');


    
    
    

