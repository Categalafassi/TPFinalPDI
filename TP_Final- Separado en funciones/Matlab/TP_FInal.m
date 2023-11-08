clear
clc

% carpeta='';
% ct=dir([carpeta,'/']);
% movefile([carpeta,'/*'])
% for i=1:length(ct)-2
%     movefile(ct(i+2).name,[num2str(i),'.dcm']);
%     movefile([num2str(i),'.dcm'],carpeta);
% end 

% a=dicomreadVolume("Paciente_5_ct/");
% a=squeeze(a);
% info=dicominfo("Paciente_5_ct/ADNI_067_S_1185_MR_MPRAGE_br_raw_20070727145737734_98_S36449_I62464.dcm");

niifo=niftiinfo('brainmask.nii');
V = niftiread('brainmask.nii');
k=4;
SpaceBetweenSlices=1.2;

[Vol_Liq, Vol_GrayM, Vol_WhiteM] = Calculate_volumes(V, k, SpaceBetweenSlices);
