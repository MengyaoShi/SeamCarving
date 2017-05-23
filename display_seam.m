function seam_matrix=display_seam(im,seam,seamDirection)
[height, width, color_dim]=size(im);
seam_matrix=zeros(height, width);
if strcmp(seamDirection,'VERTICAL')
    rows=1:height;
    seam=[rows; seam];
elseif strcmp(seamDirection, 'HORIZONTAL')
        columns=1:width;
        seam=[seam; columns];      
else
    msgbox('third input has to be HORIZONTAL or VERTICAL')
end
image(im)
line( seam(2,:), seam(1,:),'color','r')
    