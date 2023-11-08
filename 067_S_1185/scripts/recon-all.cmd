\n\n#---------------------------------
# New invocation of recon-all Tue Oct 31 11:50:55 -03 2023 
\n mri_convert /Users/cundo/Desktop/favaloro/PDI/Alzheimer/Paciente_3/Paciente_5_ct/ADNI_067_S_1185_MR_MPRAGE_br_raw_20070727145737734_98_S36449_I62464.dcm /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/orig/001.mgz \n
#--------------------------------------------
#@# MotionCor Tue Oct 31 11:50:59 -03 2023
\n cp /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/orig/001.mgz /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/rawavg.mgz \n
\n mri_info /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/rawavg.mgz \n
\n mri_convert /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/rawavg.mgz /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/orig.mgz --conform \n
\n mri_add_xform_to_header -c /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/transforms/talairach.xfm /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/orig.mgz /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/orig.mgz \n
\n mri_info /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Tue Oct 31 11:51:03 -03 2023
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 \n
\n talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm \n
talairach_avi log file is transforms/talairach_avi.log...
\n cp transforms/talairach.auto.xfm transforms/talairach.xfm \n
lta_convert --src orig.mgz --trg /Applications/freesurfer/7.4.1/average/mni305.cor.mgz --inxfm transforms/talairach.xfm --outlta transforms/talairach.xfm.lta --subject fsaverage --ltavox2vox
#--------------------------------------------
#@# Talairach Failure Detection Tue Oct 31 11:53:14 -03 2023
\n talairach_afd -T 0.005 -xfm transforms/talairach.xfm \n
\n awk -f /Applications/freesurfer/7.4.1/bin/extract_talairach_avi_QA.awk /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/transforms/talairach_avi.log \n
\n tal_QC_AZS /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/transforms/talairach_avi.log \n
#--------------------------------------------
#@# Nu Intensity Correction Tue Oct 31 11:53:14 -03 2023
\n mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --n 2 --ants-n4 \n
\n mri_add_xform_to_header -c /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/transforms/talairach.xfm nu.mgz nu.mgz \n
#--------------------------------------------
#@# Intensity Normalization Tue Oct 31 11:55:27 -03 2023
\n mri_normalize -g 1 -seed 1234 -mprage nu.mgz T1.mgz \n
#--------------------------------------------
#@# Skull Stripping Tue Oct 31 11:57:09 -03 2023
\n mri_em_register -skull nu.mgz /Applications/freesurfer/7.4.1/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta \n
\n mri_watershed -T1 -brain_atlas /Applications/freesurfer/7.4.1/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta T1.mgz brainmask.auto.mgz \n
\n cp brainmask.auto.mgz brainmask.mgz \n
\n\n#---------------------------------
# New invocation of recon-all Tue Oct 31 13:25:24 -03 2023 
#--------------------------------------------
#@# MotionCor Tue Oct 31 13:25:39 -03 2023
\n mri_info /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/rawavg.mgz \n
\n mri_info /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/orig.mgz \n
#--------------------------------------------
#@# Talairach Tue Oct 31 13:25:39 -03 2023
\n mri_nu_correct.mni --no-rescale --i orig.mgz --o orig_nu.mgz --ants-n4 --n 1 --proto-iters 1000 --distance 50 \n
\n talairach_avi --i orig_nu.mgz --xfm transforms/talairach.auto.xfm \n
talairach_avi log file is transforms/talairach_avi.log...
\nINFO: transforms/talairach.xfm already exists!
The new transforms/talairach.auto.xfm will not be copied to transforms/talairach.xfm
This is done to retain any edits made to transforms/talairach.xfm
Add the -clean-tal flag to recon-all to overwrite transforms/talairach.xfm\n
#--------------------------------------------
#@# Talairach Failure Detection Tue Oct 31 13:27:46 -03 2023
\n talairach_afd -T 0.005 -xfm transforms/talairach.xfm \n
\n awk -f /Applications/freesurfer/7.4.1/bin/extract_talairach_avi_QA.awk /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/transforms/talairach_avi.log \n
\n tal_QC_AZS /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/transforms/talairach_avi.log \n
#--------------------------------------------
#@# Nu Intensity Correction Tue Oct 31 13:27:46 -03 2023
\n mri_nu_correct.mni --i orig.mgz --o nu.mgz --uchar transforms/talairach.xfm --n 2 --ants-n4 \n
\n mri_add_xform_to_header -c /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/transforms/talairach.xfm nu.mgz nu.mgz \n
#--------------------------------------------
#@# Intensity Normalization Tue Oct 31 13:29:58 -03 2023
\n mri_normalize -g 1 -seed 1234 -mprage nu.mgz T1.mgz \n
#--------------------------------------------
#@# Skull Stripping Tue Oct 31 13:31:39 -03 2023
\n mri_watershed -keep brainmask.auto.mgz brainmask.mgz brainmask.mgz -T1 -brain_atlas /Applications/freesurfer/7.4.1/average/RB_all_withskull_2020_01_02.gca transforms/talairach_with_skull.lta T1.mgz brainmask.auto.mgz \n
\nINFO: brainmask.mgz already exists!
It will not be overwritten.
This is done to retain any edits made to brainmask.mgz.
Add the -clean-bm flag to recon-all to overwrite brainmask.mgz.\n
#-------------------------------------
#@# EM Registration Tue Oct 31 13:31:52 -03 2023
\n mri_em_register -uns 3 -mask brainmask.mgz nu.mgz /Applications/freesurfer/7.4.1/average/RB_all_2020-01-02.gca transforms/talairach.lta \n
#--------------------------------------
#@# CA Normalize Tue Oct 31 13:40:00 -03 2023
\n mri_ca_normalize -c ctrl_pts.mgz -mask brainmask.mgz nu.mgz /Applications/freesurfer/7.4.1/average/RB_all_2020-01-02.gca transforms/talairach.lta norm.mgz \n
#--------------------------------------
#@# CA Reg Tue Oct 31 13:40:50 -03 2023
\n mri_ca_register -nobigventricles -T transforms/talairach.lta -align-after -mask brainmask.mgz norm.mgz /Applications/freesurfer/7.4.1/average/RB_all_2020-01-02.gca transforms/talairach.m3z \n
#--------------------------------------
#@# SubCort Seg Tue Oct 31 14:51:32 -03 2023
\n mri_ca_label -relabel_unlikely 9 .3 -prior 0.5 -align norm.mgz transforms/talairach.m3z /Applications/freesurfer/7.4.1/average/RB_all_2020-01-02.gca aseg.auto_noCCseg.mgz \n
#--------------------------------------
#@# CC Seg Tue Oct 31 15:24:08 -03 2023
\n mri_cc -aseg aseg.auto_noCCseg.mgz -o aseg.auto.mgz -lta /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/transforms/cc_up.lta Paciente_3 \n
#--------------------------------------
#@# Merge ASeg Tue Oct 31 15:24:36 -03 2023
\n cp aseg.auto.mgz aseg.presurf.mgz \n
#--------------------------------------------
#@# Intensity Normalization2 Tue Oct 31 15:24:36 -03 2023
\n mri_normalize -seed 1234 -mprage -aseg aseg.presurf.mgz -mask brainmask.mgz norm.mgz brain.mgz \n
#--------------------------------------------
#@# Mask BFS Tue Oct 31 15:26:47 -03 2023
\n mri_mask -T 5 brain.mgz brainmask.mgz brain.finalsurfs.mgz \n
#--------------------------------------------
#@# WM Segmentation Tue Oct 31 15:26:48 -03 2023
\n AntsDenoiseImageFs -i brain.mgz -o antsdn.brain.mgz \n
\n mri_segment -wsizemm 13 -mprage antsdn.brain.mgz wm.seg.mgz \n
\n mri_edit_wm_with_aseg -keep-in wm.seg.mgz brain.mgz aseg.presurf.mgz wm.asegedit.mgz \n
\n mri_pretess wm.asegedit.mgz wm norm.mgz wm.mgz \n
#--------------------------------------------
#@# Fill Tue Oct 31 15:28:49 -03 2023
\n mri_fill -a ../scripts/ponscc.cut.log -xform transforms/talairach.lta -segmentation aseg.presurf.mgz -ctab /Applications/freesurfer/7.4.1/SubCorticalMassLUT.txt wm.mgz filled.mgz \n
 cp filled.mgz filled.auto.mgz
#--------------------------------------------
#@# Tessellate lh Tue Oct 31 15:29:38 -03 2023
\n mri_pretess ../mri/filled.mgz 255 ../mri/norm.mgz ../mri/filled-pretess255.mgz \n
\n mri_tessellate ../mri/filled-pretess255.mgz 255 ../surf/lh.orig.nofix \n
\n rm -f ../mri/filled-pretess255.mgz \n
\n mris_extract_main_component ../surf/lh.orig.nofix ../surf/lh.orig.nofix \n
#--------------------------------------------
#@# Tessellate rh Tue Oct 31 15:29:42 -03 2023
\n mri_pretess ../mri/filled.mgz 127 ../mri/norm.mgz ../mri/filled-pretess127.mgz \n
\n mri_tessellate ../mri/filled-pretess127.mgz 127 ../surf/rh.orig.nofix \n
\n rm -f ../mri/filled-pretess127.mgz \n
\n mris_extract_main_component ../surf/rh.orig.nofix ../surf/rh.orig.nofix \n
#--------------------------------------------
#@# Smooth1 lh Tue Oct 31 15:29:44 -03 2023
\n mris_smooth -nw -seed 1234 ../surf/lh.orig.nofix ../surf/lh.smoothwm.nofix \n
#--------------------------------------------
#@# Smooth1 rh Tue Oct 31 15:29:46 -03 2023
\n mris_smooth -nw -seed 1234 ../surf/rh.orig.nofix ../surf/rh.smoothwm.nofix \n
#--------------------------------------------
#@# Inflation1 lh Tue Oct 31 15:29:49 -03 2023
\n mris_inflate -no-save-sulc ../surf/lh.smoothwm.nofix ../surf/lh.inflated.nofix \n
#--------------------------------------------
#@# Inflation1 rh Tue Oct 31 15:30:01 -03 2023
\n mris_inflate -no-save-sulc ../surf/rh.smoothwm.nofix ../surf/rh.inflated.nofix \n
#--------------------------------------------
#@# QSphere lh Tue Oct 31 15:30:14 -03 2023
\n mris_sphere -q -p 6 -a 128 -seed 1234 ../surf/lh.inflated.nofix ../surf/lh.qsphere.nofix \n
#--------------------------------------------
#@# QSphere rh Tue Oct 31 15:46:42 -03 2023
\n mris_sphere -q -p 6 -a 128 -seed 1234 ../surf/rh.inflated.nofix ../surf/rh.qsphere.nofix \n
#@# Fix Topology lh Tue Oct 31 16:03:19 -03 2023
\n mris_fix_topology -mgz -sphere qsphere.nofix -inflated inflated.nofix -orig orig.nofix -out orig.premesh -ga -seed 1234 Paciente_3 lh \n
#@# Fix Topology rh Tue Oct 31 16:04:47 -03 2023
\n mris_fix_topology -mgz -sphere qsphere.nofix -inflated inflated.nofix -orig orig.nofix -out orig.premesh -ga -seed 1234 Paciente_3 rh \n
\n mris_euler_number ../surf/lh.orig.premesh \n
\n mris_euler_number ../surf/rh.orig.premesh \n
\n mris_remesh --remesh --iters 3 --input /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.orig.premesh --output /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.orig \n
\n mris_remesh --remesh --iters 3 --input /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.orig.premesh --output /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.orig \n
\n mris_remove_intersection ../surf/lh.orig ../surf/lh.orig \n
\n rm -f ../surf/lh.inflated \n
\n mris_remove_intersection ../surf/rh.orig ../surf/rh.orig \n
\n rm -f ../surf/rh.inflated \n
#--------------------------------------------
#@# AutoDetGWStats lh Tue Oct 31 16:07:38 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.lh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/lh.orig.premesh
#--------------------------------------------
#@# AutoDetGWStats rh Tue Oct 31 16:07:42 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_autodet_gwstats --o ../surf/autodet.gw.stats.rh.dat --i brain.finalsurfs.mgz --wm wm.mgz --surf ../surf/rh.orig.premesh
#--------------------------------------------
#@# WhitePreAparc lh Tue Oct 31 16:07:46 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --wm wm.mgz --threads 1 --invol brain.finalsurfs.mgz --lh --i ../surf/lh.orig --o ../surf/lh.white.preaparc --white --seg aseg.presurf.mgz --nsmooth 5
#--------------------------------------------
#@# WhitePreAparc rh Tue Oct 31 16:10:46 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --wm wm.mgz --threads 1 --invol brain.finalsurfs.mgz --rh --i ../surf/rh.orig --o ../surf/rh.white.preaparc --white --seg aseg.presurf.mgz --nsmooth 5
#--------------------------------------------
#@# CortexLabel lh Tue Oct 31 16:13:45 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 0 ../label/lh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg lh Tue Oct 31 16:14:00 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mri_label2label --label-cortex ../surf/lh.white.preaparc aseg.presurf.mgz 1 ../label/lh.cortex+hipamyg.label
#--------------------------------------------
#@# CortexLabel rh Tue Oct 31 16:14:15 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 0 ../label/rh.cortex.label
#--------------------------------------------
#@# CortexLabel+HipAmyg rh Tue Oct 31 16:14:32 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mri_label2label --label-cortex ../surf/rh.white.preaparc aseg.presurf.mgz 1 ../label/rh.cortex+hipamyg.label
#--------------------------------------------
#@# Smooth2 lh Tue Oct 31 16:14:49 -03 2023
\n mris_smooth -n 3 -nw -seed 1234 ../surf/lh.white.preaparc ../surf/lh.smoothwm \n
#--------------------------------------------
#@# Smooth2 rh Tue Oct 31 16:14:51 -03 2023
\n mris_smooth -n 3 -nw -seed 1234 ../surf/rh.white.preaparc ../surf/rh.smoothwm \n
#--------------------------------------------
#@# Inflation2 lh Tue Oct 31 16:14:54 -03 2023
\n mris_inflate ../surf/lh.smoothwm ../surf/lh.inflated \n
#--------------------------------------------
#@# Inflation2 rh Tue Oct 31 16:15:08 -03 2023
\n mris_inflate ../surf/rh.smoothwm ../surf/rh.inflated \n
#--------------------------------------------
#@# Curv .H and .K lh Tue Oct 31 16:15:22 -03 2023
\n mris_curvature -w -seed 1234 lh.white.preaparc \n
\n mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 lh.inflated \n
#--------------------------------------------
#@# Curv .H and .K rh Tue Oct 31 16:15:58 -03 2023
\n mris_curvature -w -seed 1234 rh.white.preaparc \n
\n mris_curvature -seed 1234 -thresh .999 -n -a 5 -w -distances 10 10 rh.inflated \n
#--------------------------------------------
#@# Sphere lh Tue Oct 31 16:16:36 -03 2023
\n mris_sphere -seed 1234 ../surf/lh.inflated ../surf/lh.sphere \n
#--------------------------------------------
#@# Sphere rh Tue Oct 31 16:44:55 -03 2023
\n mris_sphere -seed 1234 ../surf/rh.inflated ../surf/rh.sphere \n
#--------------------------------------------
#@# Surf Reg lh Tue Oct 31 16:51:11 -03 2023
\n mris_register -curv ../surf/lh.sphere /Applications/freesurfer/7.4.1/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/lh.sphere.reg \n
\n ln -sf lh.sphere.reg lh.fsaverage.sphere.reg \n
#--------------------------------------------
#@# Surf Reg rh Tue Oct 31 17:00:34 -03 2023
\n mris_register -curv ../surf/rh.sphere /Applications/freesurfer/7.4.1/average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif ../surf/rh.sphere.reg \n
\n ln -sf rh.sphere.reg rh.fsaverage.sphere.reg \n
#--------------------------------------------
#@# Jacobian white lh Tue Oct 31 17:11:24 -03 2023
\n mris_jacobian ../surf/lh.white.preaparc ../surf/lh.sphere.reg ../surf/lh.jacobian_white \n
#--------------------------------------------
#@# Jacobian white rh Tue Oct 31 17:11:25 -03 2023
\n mris_jacobian ../surf/rh.white.preaparc ../surf/rh.sphere.reg ../surf/rh.jacobian_white \n
#--------------------------------------------
#@# AvgCurv lh Tue Oct 31 17:11:26 -03 2023
\n mrisp_paint -a 5 /Applications/freesurfer/7.4.1/average/lh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/lh.sphere.reg ../surf/lh.avg_curv \n
#--------------------------------------------
#@# AvgCurv rh Tue Oct 31 17:11:26 -03 2023
\n mrisp_paint -a 5 /Applications/freesurfer/7.4.1/average/rh.folding.atlas.acfb40.noaparc.i12.2016-08-02.tif#6 ../surf/rh.sphere.reg ../surf/rh.avg_curv \n
#-----------------------------------------
#@# Cortical Parc lh Tue Oct 31 17:11:27 -03 2023
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 Paciente_3 lh ../surf/lh.sphere.reg /Applications/freesurfer/7.4.1/average/lh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.annot \n
#-----------------------------------------
#@# Cortical Parc rh Tue Oct 31 17:11:34 -03 2023
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 Paciente_3 rh ../surf/rh.sphere.reg /Applications/freesurfer/7.4.1/average/rh.DKaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.annot \n
#--------------------------------------------
#@# WhiteSurfs lh Tue Oct 31 17:11:41 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --seg aseg.presurf.mgz --threads 1 --wm wm.mgz --invol brain.finalsurfs.mgz --lh --i ../surf/lh.white.preaparc --o ../surf/lh.white --white --nsmooth 0 --rip-label ../label/lh.cortex.label --rip-bg --rip-surf ../surf/lh.white.preaparc --aparc ../label/lh.aparc.annot
#--------------------------------------------
#@# WhiteSurfs rh Tue Oct 31 17:16:58 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --seg aseg.presurf.mgz --threads 1 --wm wm.mgz --invol brain.finalsurfs.mgz --rh --i ../surf/rh.white.preaparc --o ../surf/rh.white --white --nsmooth 0 --rip-label ../label/rh.cortex.label --rip-bg --rip-surf ../surf/rh.white.preaparc --aparc ../label/rh.aparc.annot
#--------------------------------------------
#@# T1PialSurf lh Tue Oct 31 17:22:14 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.lh.dat --seg aseg.presurf.mgz --threads 1 --wm wm.mgz --invol brain.finalsurfs.mgz --lh --i ../surf/lh.white --o ../surf/lh.pial.T1 --pial --nsmooth 0 --rip-label ../label/lh.cortex+hipamyg.label --pin-medial-wall ../label/lh.cortex.label --aparc ../label/lh.aparc.annot --repulse-surf ../surf/lh.white --white-surf ../surf/lh.white
#--------------------------------------------
#@# T1PialSurf rh Tue Oct 31 17:30:30 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --adgws-in ../surf/autodet.gw.stats.rh.dat --seg aseg.presurf.mgz --threads 1 --wm wm.mgz --invol brain.finalsurfs.mgz --rh --i ../surf/rh.white --o ../surf/rh.pial.T1 --pial --nsmooth 0 --rip-label ../label/rh.cortex+hipamyg.label --pin-medial-wall ../label/rh.cortex.label --aparc ../label/rh.aparc.annot --repulse-surf ../surf/rh.white --white-surf ../surf/rh.white
#@# white curv lh Tue Oct 31 17:33:59 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --curv-map ../surf/lh.white 2 10 ../surf/lh.curv
#@# white area lh Tue Oct 31 17:34:01 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --area-map ../surf/lh.white ../surf/lh.area
#@# pial curv lh Tue Oct 31 17:34:01 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --curv-map ../surf/lh.pial 2 10 ../surf/lh.curv.pial
#@# pial area lh Tue Oct 31 17:34:03 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --area-map ../surf/lh.pial ../surf/lh.area.pial
#@# thickness lh Tue Oct 31 17:34:03 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --thickness ../surf/lh.white ../surf/lh.pial 20 5 ../surf/lh.thickness
#@# area and vertex vol lh Tue Oct 31 17:34:22 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --thickness ../surf/lh.white ../surf/lh.pial 20 5 ../surf/lh.thickness
#@# white curv rh Tue Oct 31 17:34:24 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --curv-map ../surf/rh.white 2 10 ../surf/rh.curv
#@# white area rh Tue Oct 31 17:34:25 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --area-map ../surf/rh.white ../surf/rh.area
#@# pial curv rh Tue Oct 31 17:34:26 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --curv-map ../surf/rh.pial 2 10 ../surf/rh.curv.pial
#@# pial area rh Tue Oct 31 17:34:27 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --area-map ../surf/rh.pial ../surf/rh.area.pial
#@# thickness rh Tue Oct 31 17:34:28 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --thickness ../surf/rh.white ../surf/rh.pial 20 5 ../surf/rh.thickness
#@# area and vertex vol rh Tue Oct 31 17:34:48 -03 2023
cd /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri
mris_place_surface --thickness ../surf/rh.white ../surf/rh.pial 20 5 ../surf/rh.thickness
\n#-----------------------------------------
#@# Curvature Stats lh Tue Oct 31 17:34:49 -03 2023
\n mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/lh.curv.stats -F smoothwm Paciente_3 lh curv sulc \n
\n#-----------------------------------------
#@# Curvature Stats rh Tue Oct 31 17:34:51 -03 2023
\n mris_curvature_stats -m --writeCurvatureFiles -G -o ../stats/rh.curv.stats -F smoothwm Paciente_3 rh curv sulc \n
#--------------------------------------------
#@# Cortical ribbon mask Tue Oct 31 17:34:54 -03 2023
\n mris_volmask --aseg_name aseg.presurf --label_left_white 2 --label_left_ribbon 3 --label_right_white 41 --label_right_ribbon 42 --save_ribbon Paciente_3 \n
#-----------------------------------------
#@# Cortical Parc 2 lh Tue Oct 31 17:38:11 -03 2023
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 Paciente_3 lh ../surf/lh.sphere.reg /Applications/freesurfer/7.4.1/average/lh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.a2009s.annot \n
#-----------------------------------------
#@# Cortical Parc 2 rh Tue Oct 31 17:38:21 -03 2023
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 Paciente_3 rh ../surf/rh.sphere.reg /Applications/freesurfer/7.4.1/average/rh.CDaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.a2009s.annot \n
#-----------------------------------------
#@# Cortical Parc 3 lh Tue Oct 31 17:38:31 -03 2023
\n mris_ca_label -l ../label/lh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 Paciente_3 lh ../surf/lh.sphere.reg /Applications/freesurfer/7.4.1/average/lh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/lh.aparc.DKTatlas.annot \n
#-----------------------------------------
#@# Cortical Parc 3 rh Tue Oct 31 17:38:38 -03 2023
\n mris_ca_label -l ../label/rh.cortex.label -aseg ../mri/aseg.presurf.mgz -seed 1234 Paciente_3 rh ../surf/rh.sphere.reg /Applications/freesurfer/7.4.1/average/rh.DKTaparc.atlas.acfb40.noaparc.i12.2016-08-02.gcs ../label/rh.aparc.DKTatlas.annot \n
#-----------------------------------------
#@# WM/GM Contrast lh Tue Oct 31 17:38:46 -03 2023
\n pctsurfcon --s Paciente_3 --lh-only \n
#-----------------------------------------
#@# WM/GM Contrast rh Tue Oct 31 17:38:49 -03 2023
\n pctsurfcon --s Paciente_3 --rh-only \n
#-----------------------------------------
#@# Relabel Hypointensities Tue Oct 31 17:38:51 -03 2023
\n mri_relabel_hypointensities aseg.presurf.mgz ../surf aseg.presurf.hypos.mgz \n
#-----------------------------------------
#@# APas-to-ASeg Tue Oct 31 17:39:03 -03 2023
\n mri_surf2volseg --o aseg.mgz --i aseg.presurf.hypos.mgz --fix-presurf-with-ribbon /Applications/freesurfer/7.4.1/subjects/Paciente_3/mri/ribbon.mgz --threads 1 --lh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.cortex.label --lh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.white --lh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.pial --rh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.cortex.label --rh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.white --rh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.pial \n
\n mri_brainvol_stats --subject Paciente_3 \n
#-----------------------------------------
#@# AParc-to-ASeg aparc Tue Oct 31 17:39:18 -03 2023
\n mri_surf2volseg --o aparc+aseg.mgz --label-cortex --i aseg.mgz --threads 1 --lh-annot /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.aparc.annot 1000 --lh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.cortex.label --lh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.white --lh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.pial --rh-annot /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.aparc.annot 2000 --rh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.cortex.label --rh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.white --rh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.pial \n
#-----------------------------------------
#@# AParc-to-ASeg aparc.a2009s Tue Oct 31 17:40:00 -03 2023
\n mri_surf2volseg --o aparc.a2009s+aseg.mgz --label-cortex --i aseg.mgz --threads 1 --lh-annot /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.aparc.a2009s.annot 11100 --lh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.cortex.label --lh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.white --lh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.pial --rh-annot /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.aparc.a2009s.annot 12100 --rh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.cortex.label --rh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.white --rh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.pial \n
#-----------------------------------------
#@# AParc-to-ASeg aparc.DKTatlas Tue Oct 31 17:40:42 -03 2023
\n mri_surf2volseg --o aparc.DKTatlas+aseg.mgz --label-cortex --i aseg.mgz --threads 1 --lh-annot /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.aparc.DKTatlas.annot 1000 --lh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.cortex.label --lh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.white --lh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.pial --rh-annot /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.aparc.DKTatlas.annot 2000 --rh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.cortex.label --rh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.white --rh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.pial \n
#-----------------------------------------
#@# WMParc Tue Oct 31 17:41:24 -03 2023
\n mri_surf2volseg --o wmparc.mgz --label-wm --i aparc+aseg.mgz --threads 1 --lh-annot /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.aparc.annot 3000 --lh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/lh.cortex.label --lh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.white --lh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/lh.pial --rh-annot /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.aparc.annot 4000 --rh-cortex-mask /Applications/freesurfer/7.4.1/subjects/Paciente_3/label/rh.cortex.label --rh-white /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.white --rh-pial /Applications/freesurfer/7.4.1/subjects/Paciente_3/surf/rh.pial \n
\n mri_segstats --seed 1234 --seg mri/wmparc.mgz --sum stats/wmparc.stats --pv mri/norm.mgz --excludeid 0 --brainmask mri/brainmask.mgz --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --subject Paciente_3 --surf-wm-vol --ctab /Applications/freesurfer/7.4.1/WMParcStatsLUT.txt --etiv \n
#-----------------------------------------
#@# Parcellation Stats lh Tue Oct 31 17:45:58 -03 2023
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab Paciente_3 lh white \n
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.pial.stats -b -a ../label/lh.aparc.annot -c ../label/aparc.annot.ctab Paciente_3 lh pial \n
#-----------------------------------------
#@# Parcellation Stats rh Tue Oct 31 17:46:11 -03 2023
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab Paciente_3 rh white \n
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.pial.stats -b -a ../label/rh.aparc.annot -c ../label/aparc.annot.ctab Paciente_3 rh pial \n
#-----------------------------------------
#@# Parcellation Stats 2 lh Tue Oct 31 17:46:23 -03 2023
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.a2009s.stats -b -a ../label/lh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab Paciente_3 lh white \n
#-----------------------------------------
#@# Parcellation Stats 2 rh Tue Oct 31 17:46:30 -03 2023
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.a2009s.stats -b -a ../label/rh.aparc.a2009s.annot -c ../label/aparc.annot.a2009s.ctab Paciente_3 rh white \n
#-----------------------------------------
#@# Parcellation Stats 3 lh Tue Oct 31 17:46:37 -03 2023
\n mris_anatomical_stats -th3 -mgz -cortex ../label/lh.cortex.label -f ../stats/lh.aparc.DKTatlas.stats -b -a ../label/lh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab Paciente_3 lh white \n
#-----------------------------------------
#@# Parcellation Stats 3 rh Tue Oct 31 17:46:43 -03 2023
\n mris_anatomical_stats -th3 -mgz -cortex ../label/rh.cortex.label -f ../stats/rh.aparc.DKTatlas.stats -b -a ../label/rh.aparc.DKTatlas.annot -c ../label/aparc.annot.DKTatlas.ctab Paciente_3 rh white \n
#--------------------------------------------
#@# ASeg Stats Tue Oct 31 17:46:49 -03 2023
\n mri_segstats --seed 1234 --seg mri/aseg.mgz --sum stats/aseg.stats --pv mri/norm.mgz --empty --brainmask mri/brainmask.mgz --brain-vol-from-seg --excludeid 0 --excl-ctxgmwm --supratent --subcortgray --in mri/norm.mgz --in-intensity-name norm --in-intensity-units MR --etiv --surf-wm-vol --surf-ctx-vol --totalgray --euler --ctab /Applications/freesurfer/7.4.1/ASegStatsLUT.txt --subject Paciente_3 \n
#--------------------------------------------
#@# BA_exvivo Labels lh Tue Oct 31 17:49:02 -03 2023
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA1_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA1_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA2_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA2_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA3a_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA3a_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA3b_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA3b_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA4a_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA4a_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA4p_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA4p_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA6_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA6_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA44_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA44_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA45_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.BA45_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.V1_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.V1_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.V2_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.V2_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.MT_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.MT_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.entorhinal_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.entorhinal_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.perirhinal_exvivo.label --trgsubject Paciente_3 --trglabel ./lh.perirhinal_exvivo.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.FG1.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./lh.FG1.mpm.vpnl.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.FG2.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./lh.FG2.mpm.vpnl.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.FG3.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./lh.FG3.mpm.vpnl.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.FG4.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./lh.FG4.mpm.vpnl.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.hOc1.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./lh.hOc1.mpm.vpnl.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.hOc2.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./lh.hOc2.mpm.vpnl.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.hOc3v.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./lh.hOc3v.mpm.vpnl.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.hOc4v.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./lh.hOc4v.mpm.vpnl.label --hemi lh --regmethod surface \n
\n mris_label2annot --s Paciente_3 --ctab /Applications/freesurfer/7.4.1/average/colortable_vpnl.txt --hemi lh --a mpm.vpnl --maxstatwinner --noverbose --l lh.FG1.mpm.vpnl.label --l lh.FG2.mpm.vpnl.label --l lh.FG3.mpm.vpnl.label --l lh.FG4.mpm.vpnl.label --l lh.hOc1.mpm.vpnl.label --l lh.hOc2.mpm.vpnl.label --l lh.hOc3v.mpm.vpnl.label --l lh.hOc4v.mpm.vpnl.label \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA1_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA1_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA2_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA2_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA3a_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA3a_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA3b_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA3b_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA4a_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA4a_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA4p_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA4p_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA6_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA6_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA44_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA44_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.BA45_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.BA45_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.V1_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.V1_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.V2_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.V2_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.MT_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.MT_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.entorhinal_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.entorhinal_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/lh.perirhinal_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./lh.perirhinal_exvivo.thresh.label --hemi lh --regmethod surface \n
\n mris_label2annot --s Paciente_3 --hemi lh --ctab /Applications/freesurfer/7.4.1/average/colortable_BA.txt --l lh.BA1_exvivo.label --l lh.BA2_exvivo.label --l lh.BA3a_exvivo.label --l lh.BA3b_exvivo.label --l lh.BA4a_exvivo.label --l lh.BA4p_exvivo.label --l lh.BA6_exvivo.label --l lh.BA44_exvivo.label --l lh.BA45_exvivo.label --l lh.V1_exvivo.label --l lh.V2_exvivo.label --l lh.MT_exvivo.label --l lh.perirhinal_exvivo.label --l lh.entorhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose \n
\n mris_label2annot --s Paciente_3 --hemi lh --ctab /Applications/freesurfer/7.4.1/average/colortable_BA.txt --l lh.BA1_exvivo.thresh.label --l lh.BA2_exvivo.thresh.label --l lh.BA3a_exvivo.thresh.label --l lh.BA3b_exvivo.thresh.label --l lh.BA4a_exvivo.thresh.label --l lh.BA4p_exvivo.thresh.label --l lh.BA6_exvivo.thresh.label --l lh.BA44_exvivo.thresh.label --l lh.BA45_exvivo.thresh.label --l lh.V1_exvivo.thresh.label --l lh.V2_exvivo.thresh.label --l lh.MT_exvivo.thresh.label --l lh.perirhinal_exvivo.thresh.label --l lh.entorhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.stats -b -a ./lh.BA_exvivo.annot -c ./BA_exvivo.ctab Paciente_3 lh white \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/lh.BA_exvivo.thresh.stats -b -a ./lh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab Paciente_3 lh white \n
#--------------------------------------------
#@# BA_exvivo Labels rh Tue Oct 31 17:51:21 -03 2023
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA1_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA1_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA2_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA2_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA3a_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA3a_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA3b_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA3b_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA4a_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA4a_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA4p_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA4p_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA6_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA6_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA44_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA44_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA45_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.BA45_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.V1_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.V1_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.V2_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.V2_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.MT_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.MT_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.entorhinal_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.entorhinal_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.perirhinal_exvivo.label --trgsubject Paciente_3 --trglabel ./rh.perirhinal_exvivo.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.FG1.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./rh.FG1.mpm.vpnl.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.FG2.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./rh.FG2.mpm.vpnl.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.FG3.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./rh.FG3.mpm.vpnl.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.FG4.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./rh.FG4.mpm.vpnl.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.hOc1.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./rh.hOc1.mpm.vpnl.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.hOc2.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./rh.hOc2.mpm.vpnl.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.hOc3v.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./rh.hOc3v.mpm.vpnl.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.hOc4v.mpm.vpnl.label --trgsubject Paciente_3 --trglabel ./rh.hOc4v.mpm.vpnl.label --hemi rh --regmethod surface \n
\n mris_label2annot --s Paciente_3 --ctab /Applications/freesurfer/7.4.1/average/colortable_vpnl.txt --hemi rh --a mpm.vpnl --maxstatwinner --noverbose --l rh.FG1.mpm.vpnl.label --l rh.FG2.mpm.vpnl.label --l rh.FG3.mpm.vpnl.label --l rh.FG4.mpm.vpnl.label --l rh.hOc1.mpm.vpnl.label --l rh.hOc2.mpm.vpnl.label --l rh.hOc3v.mpm.vpnl.label --l rh.hOc4v.mpm.vpnl.label \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA1_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA1_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA2_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA2_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA3a_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA3a_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA3b_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA3b_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA4a_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA4a_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA4p_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA4p_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA6_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA6_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA44_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA44_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.BA45_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.BA45_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.V1_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.V1_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.V2_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.V2_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.MT_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.MT_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.entorhinal_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.entorhinal_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mri_label2label --srcsubject fsaverage --srclabel /Applications/freesurfer/7.4.1/subjects/fsaverage/label/rh.perirhinal_exvivo.thresh.label --trgsubject Paciente_3 --trglabel ./rh.perirhinal_exvivo.thresh.label --hemi rh --regmethod surface \n
\n mris_label2annot --s Paciente_3 --hemi rh --ctab /Applications/freesurfer/7.4.1/average/colortable_BA.txt --l rh.BA1_exvivo.label --l rh.BA2_exvivo.label --l rh.BA3a_exvivo.label --l rh.BA3b_exvivo.label --l rh.BA4a_exvivo.label --l rh.BA4p_exvivo.label --l rh.BA6_exvivo.label --l rh.BA44_exvivo.label --l rh.BA45_exvivo.label --l rh.V1_exvivo.label --l rh.V2_exvivo.label --l rh.MT_exvivo.label --l rh.perirhinal_exvivo.label --l rh.entorhinal_exvivo.label --a BA_exvivo --maxstatwinner --noverbose \n
\n mris_label2annot --s Paciente_3 --hemi rh --ctab /Applications/freesurfer/7.4.1/average/colortable_BA.txt --l rh.BA1_exvivo.thresh.label --l rh.BA2_exvivo.thresh.label --l rh.BA3a_exvivo.thresh.label --l rh.BA3b_exvivo.thresh.label --l rh.BA4a_exvivo.thresh.label --l rh.BA4p_exvivo.thresh.label --l rh.BA6_exvivo.thresh.label --l rh.BA44_exvivo.thresh.label --l rh.BA45_exvivo.thresh.label --l rh.V1_exvivo.thresh.label --l rh.V2_exvivo.thresh.label --l rh.MT_exvivo.thresh.label --l rh.perirhinal_exvivo.thresh.label --l rh.entorhinal_exvivo.thresh.label --a BA_exvivo.thresh --maxstatwinner --noverbose \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.stats -b -a ./rh.BA_exvivo.annot -c ./BA_exvivo.ctab Paciente_3 rh white \n
\n mris_anatomical_stats -th3 -mgz -f ../stats/rh.BA_exvivo.thresh.stats -b -a ./rh.BA_exvivo.thresh.annot -c ./BA_exvivo.thresh.ctab Paciente_3 rh white \n
