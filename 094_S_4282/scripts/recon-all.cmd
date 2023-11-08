\n\n#---------------------------------
# New invocation of recon-all Wed Nov  8 17:04:02 -03 2023 
\n mri_convert /Users/cundo/Downloads/ADNI/094_S_4282/ADNI_094_S_4282_MR_Sag_IR-SPGR__br_raw_20111020160651362_27_S125980_I261855.dcm /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/orig/001.mgz \n
#--------------------------------------------
#@# MotionCor Wed Nov  8 17:04:19 -03 2023
\n cp /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/orig/001.mgz /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/rawavg.mgz \n
\n mri_info /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/rawavg.mgz \n
\n mri_convert /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/rawavg.mgz /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/orig.mgz --conform \n
\n mri_add_xform_to_header -c /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/transforms/talairach.xfm /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/orig.mgz /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/orig.mgz \n
\n mri_info /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Wed Nov  8 17:04:26 -03 2023
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 \n
\n talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm \n
talairach_avi log file is transforms/talairach_avi.log...
\n cp transforms/talairach.auto.xfm transforms/talairach.xfm \n
lta_convert --src orig.mgz --trg /Applications/freesurfer/7.4.1/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Wed Nov  8 17:06:36 -03 2023
\n talairach_afd -T 0.005 -xfm transforms/talairach.xfm \n
\n awk -f /Applications/freesurfer/7.4.1/bin/extract_talairach_avi_QA.awk /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/transforms/talairach_avi.log \n
\n tal_QC_AZS /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/transforms/talairach_avi.log \n
#--------------------------------------------
#@# Nu Intensity Correction Wed Nov  8 17:06:37 -03 2023
\n mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --n 2 --ants-n4 \n
\n mri_add_xform_to_header -c /Applications/freesurfer/7.4.1/subjects/094_S_4282/mri/transforms/talairach.xfm nu.mgz nu.mgz \n
#--------------------------------------------
#@# Intensity Normalization Wed Nov  8 17:09:18 -03 2023
\n mri_normalize -g 1 -seed 1234 -mprage nu.mgz T1.mgz \n
#--------------------------------------------
#@# Skull Stripping Wed Nov  8 17:11:33 -03 2023
\n mri_em_register -skull nu.mgz /Applications/freesurfer/7.4.1/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta \n
\n mri_watershed -T1 -brain_atlas /Applications/freesurfer/7.4.1/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta T1.mgz brainmask.auto.mgz \n
\n cp brainmask.auto.mgz brainmask.mgz \n
