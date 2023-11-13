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

niifo=niftiinfo('067_S_1185_brainmask.nii');
V = niftiread('067_S_1185_brainmask.nii');
k=4;
img_spacing=1.2;
mm_px=1.3;

[Vol_Liq, Vol_GrayM, Vol_WhiteM] = Calculate_volumes(V, k, img_spacing,mm_px);

[Vol_Liq Vol_GrayM Vol_WhiteM] % Lo usé para copiar en excel
%volumeViewer(V) % visualizar en 3d 