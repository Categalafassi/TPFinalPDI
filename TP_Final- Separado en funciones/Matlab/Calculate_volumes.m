function [Vol_Liq, Vol_GrayM, Vol_WhiteM] = Calculate_volumes(Volume, k, SpaceBetweenSlices)

mm_px=1.3;
Areas=[0,0,0];

for i=1:length(Volume)

    if max(max(Volume(:,:,i)))>0
    FIG=Volume(:,:,i);
    Areas = Areas + Calculate_areas(FIG, k , mm_px);
    end 
end 

 Vol_Liq = SpaceBetweenSlices* Areas(3);
 Vol_GrayM= SpaceBetweenSlices * Areas(1);
 Vol_WhiteM = SpaceBetweenSlices * Areas(2);

end

