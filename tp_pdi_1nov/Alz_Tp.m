clc
clear
close all

FIG1=dicomread('ADNI_018_S_0286_MR_2T.dcm');
i=dicominfo('ADNI_018_S_0286_MR_2T.dcm');

% FIG1=dicomread('ADNI_016_S_0991_MR_Axial_PD-T2_TSE__br_raw_20061102095500534_72_S21735_I28389.dcm');
% i=dicominfo('ADNI_018_S_0286_MR_2T.dcm');

%Brain= niftiread('outbrain.nii');
%mirar el histograma para ver el valor limite bien
thresholdValue=100;
FIG_bin = FIG1 > thresholdValue;

FIG_bin = bwareafilt(FIG_bin,2);
FIG_bin = imopen(FIG_bin, true(6)); % TRUE 6
FIG_bin = bwareafilt(FIG_bin, 1);
FIG_bin = imfill(FIG_bin, 'holes');

figure(1);
subplot(1,3,1);
imshow(FIG1,[]);
subplot(1,3,2);
imshow(FIG_bin);
Segmented_FIG = FIG1;
Segmented_FIG(~FIG_bin) = 0;
subplot(1,3,3);
imshow(Segmented_FIG,[]);

Segmented_FIG=double(Segmented_FIG)/(double(max(Segmented_FIG(:)))); %normalizacion

k=4;
% [indx,centro] = kmeans(Segmented_FIG(:),k);
% count=1;
% for i=0:50
%    [indx] = indx + kmeans(Segmented_FIG(:),k);
%    count=count+1;
% end
% indx=floor(indx/count);

centroide=[0 ;0.25; 0.50 ;0.75];
A=zeros(4,1,50);
A(:,:,1)=centroide;
%[indx,C_guess] = kmeans(Segmented_FIG(:),k ,'Start',centroide);
[indx,C_guess] = kmeans(Segmented_FIG(:),k ,'Replicates',50,'Start',A);
kmeans_img=reshape(indx,size(FIG1));

figure()
imshow(kmeans_img,[]);

kmeans_img1=kmeans_img==1;
figure()
subplot(2,2,1)
imshow(kmeans_img1);
kmeans_img2=kmeans_img==2;
subplot(2,2,2)
imshow(kmeans_img2);
kmeans_img3=kmeans_img==3;
subplot(2,2,3)
imshow(kmeans_img3);
kmeans_img4=kmeans_img==4;
subplot(2,2,4)
imshow(kmeans_img4);


% 
% figure(5);
% imhist(Segmented_FIG);

% kmeans_img5=kmeans_img==5;
% subplot(2,4,5)
% imshow(kmeans_img5);
% kmeans_img6=kmeans_img==6;
% subplot(2,4,6), imshow(kmeans_img6);
% kmeans_img7=kmeans_img==7;
% subplot(2,4,7), imshow(kmeans_img7);
% kmeans_img8=kmeans_img==8;
% subplot(2,4,8),imshow(kmeans_img8);
%FIG1=dicomread('ADNI_018_S_0286_MR_2T.dcm');
%i=dicominfo('ADNI_018_S_0286_MR_2T.dcm');