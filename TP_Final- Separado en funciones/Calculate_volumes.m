function [Vol_Liq, Vol_GrayM, Vol_WhiteM] = Calculate_volumes(Volume, k,img_spacing,mm_px)

Areas=[0,0,0];
for i=1:length(Volume)

    if max(max(Volume(:,:,i)))>0
    FIG=Volume(:,:,i);
    [area_GrayM, area_WhiteM, area_liq]= Calculate_areas(FIG, k , mm_px);
    Areas(1)= Areas(1)+area_GrayM;
    Areas(2)= Areas(2)+area_WhiteM;
    Areas(3)= Areas(3)+area_liq;
    end 
end 

 Vol_Liq = img_spacing* Areas(3)/1000;
 Vol_GrayM= img_spacing * Areas(1)/1000;
 Vol_WhiteM = img_spacing * Areas(2)/1000;

end

