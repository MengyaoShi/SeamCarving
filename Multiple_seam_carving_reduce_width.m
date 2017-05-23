function [reducedIm, reducedEnergy]=Multiple_seam_carving_reduce_width(n, im, energy)
if n==0
    reducedIm=im;
    reducedEnergy=energy;
 
else
    [im_2, energy_2]=reduce_width(im, energy);
    n=n-1;
    [reducedIm, reducedEnergy]=Multiple_seam_carving_reduce_width(n, im_2, energy_2);
end
