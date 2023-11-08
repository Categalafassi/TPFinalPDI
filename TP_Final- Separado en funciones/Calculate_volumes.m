function [Vol_Liq, Vol_GrayM, Vol_WhiteM] = Calculate_volumes(Volume, FileName, k)

i=dicominfo(FileName);
mm_px=i.PixelSpacing;
Areas=[0,0,0];
img_spacing=0; % DEFINIR CUANTO ES, DE DONDE SACARLO
for i=1:length(Volume)

    if max(max(Volume(:,:,i)))>0
    FIG=Volume(:,:,i);
    Areas = Areas + Calculate_areas(FIG, k , mm_px);
    end 
end 

 Vol_Liq = img_spacing* Areas(3);
 Vol_GrayM= img_spacing * Areas(1);
 Vol_WhiteM = img_spacing * Areas(2);

end

