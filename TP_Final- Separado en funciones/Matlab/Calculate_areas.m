function [area_GrayM, area_WhiteM, area_liq  ] = Calculate_areas( SegmentedFIG, k , mm_px)
    
SegmentedFIG=double(SegmentedFIG)/(double(max(SegmentedFIG(:)))); %normalizacion
centroide=[0 ;0.25; 0.50 ;0.75];
A=zeros(4,1,50);
A(:,:,1)=centroide;
[indx] = kmeans(SegmentedFIG(:),k ,'Replicates',50,'Start',A);
kmeans_img=reshape(indx,size(FIG1));

%%para sacar fotos para la presentación
close all
figure(1)
imshow(kmeans_img);
figure(2)
subplot(1,4,1);
imshow(kmeans_img()==1);
subplot(1,4,2);
imshow(kmeans_img()==2);
subplot(1,4,3);
imshow(kmeans_img()==3);
subplot(1,4,4);
imshow(kmeans_img()==4);

pix_Liq=length(find(kmeans_img==2));
pix_WhiteM=length(find(kmeans_img==4));
pix_GrayM=length(find(kmeans_img==3));

area_liq=pix_Liq*mm_px(1);
area_WhiteM=pix_WhiteM*mm_px(1);
area_GrayM=pix_GrayM*mm_px(1);

end

