\n\n#---------------------------------
# New invocation of recon-all Thu Nov  9 13:24:03 -03 2023 
\n mri_convert /Users/cundo/Desktop/Test_Group/131_S_0123/131_S_0123_ct/ADNI_131_S_0123_MR_MP-RAGE_REPEAT_br_raw_20110405133047594_129_S103121_I226129.dcm /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/orig/001.mgz \n
#--------------------------------------------
#@# MotionCor Thu Nov  9 13:24:19 -03 2023
\n cp /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/orig/001.mgz /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/rawavg.mgz \n
\n mri_info /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/rawavg.mgz \n
\n mri_convert /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/rawavg.mgz /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/orig.mgz --conform \n
\n mri_add_xform_to_header -c /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/transforms/talairach.xfm /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/orig.mgz /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/orig.mgz \n
\n mri_info /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Thu Nov  9 13:24:25 -03 2023
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 \n
\n talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm \n
talairach_avi log file is transforms/talairach_avi.log...
\n cp transforms/talairach.auto.xfm transforms/talairach.xfm \n
lta_convert --src orig.mgz --trg /Applications/freesurfer/7.4.1/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Thu Nov  9 13:26:36 -03 2023
\n talairach_afd -T 0.005 -xfm transforms/talairach.xfm \n
\n awk -f /Applications/freesurfer/7.4.1/bin/extract_talairach_avi_QA.awk /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/transforms/talairach_avi.log \n
\n tal_QC_AZS /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/transforms/talairach_avi.log \n
#--------------------------------------------
#@# Nu Intensity Correction Thu Nov  9 13:26:36 -03 2023
\n mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --n 2 --ants-n4 \n
\n mri_add_xform_to_header -c /Applications/freesurfer/7.4.1/subjects/131_S_0123/mri/transforms/talairach.xfm nu.mgz nu.mgz \n
#--------------------------------------------
#@# Intensity Normalization Thu Nov  9 13:28:47 -03 2023
\n mri_normalize -g 1 -seed 1234 -mprage nu.mgz T1.mgz \n
#--------------------------------------------
#@# Skull Stripping Thu Nov  9 13:30:32 -03 2023
\n mri_em_register -skull nu.mgz /Applications/freesurfer/7.4.1/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta \n
\n mri_watershed -T1 -brain_atlas /Applications/freesurfer/7.4.1/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta T1.mgz brainmask.auto.mgz \n
\n cp brainmask.auto.mgz brainmask.mgz \n
