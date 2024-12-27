#!/bin/bash

# 定义输入和输出路径
input_dir="/home/wyl/FSL_BASH/ADNI"
output_dir="/home/wyl/FSL_BASH/fsl_processed"
fsl_dir="/home/wyl/FSL_BASH/temp"
tmp_dir="/home/wyl/FSL_BASH/temp.anat"
fsl_processed="/home/wyl/FSL_BASH/temp.anat/T1_biascorr_brain.nii.gz"
mkdir -p "$output_dir"

# 循环处理每个T1图像
for file in $(find $input_dir -name "*.nii"); do
  last_dir=$(basename "$file" .nii | cut -d'.' -f1)

  fsl_anat --clobber --strongbias --noseg --nosubcortseg --betfparam=0.5 -i $file -o $fsl_dir

  flirt -in $fsl_processed -ref $FSLDIR/data/standard/MNI152_T1_1mm_brain.nii.gz -out "$output_dir/"$last_dir".nii.gz" -omat "$tmp_dir/transform.mat"
  echo "$last_dir end"
done
