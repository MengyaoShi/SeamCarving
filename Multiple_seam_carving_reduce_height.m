function [reducedIm, reducedEnergy]=Multiple_seam_carving_reduce_height(n, im, energy)
if n==0
    reducedIm=im;
    reducedEnergy=energy;
 
else
    [im_2, energy_2]=reduce_height(im, energy);
    n=n-1;
    [reducedIm, reducedEnergy]=Multiple_seam_carving_reduce_height(n, im_2, energy_2);
end
