#!/bin/bash
#SBATCH -N1
#SBATCH -p ndl
#SBATCH --time 03:00:00
#SBATCH --gres=gpu:4
#SBATCH --exclusive
#SBATCH --switches=3

set -x

ulimit -s unlimited
export OMP_STACK_SIZE=4G
export OMP_NUM_THREADS=8

cd $SLURM_SUBMIT_DIR

#for b in $(cat /home/gmap/mrpm/cossevine/cucalln2_loki/scripts/blocks.txt)
#do
/opt/softs/nvidia/hpc_sdk/Linux_x86_64/24.7/compilers/bin/nsys profile \
/home/gmap/mrpm/cossevine/cucalln2_loki/compile.gpu_nvhpc_d_sys_present/main_cucalln_mf.x \
  --ngpblks 9000 --times 10 \
  --case-in /scratch/work/cossevine/tmp/cucalln/000001 \
  --verbose --method openaccsinglecolumn \
#done
##./compile.gpu_nvhpc_d/main_cucalln_mf.x \
##  --case t1798.cpu_intel_d --stack 60 --nproma 32 --ngpblks 1 --task-list 66 \
##  --block-list  10 --verbose --out cucalln.dat --single-column --diff
##
##exit
##
##for b in $(cat scripts/blocks.txt)
##do
##
##./compile.gpu_nvhpc_d/main_cucalln_mf.x \
##  --case t1798.cpu_intel_d --stack 60 --nproma 32 --ngpblks $b --task-list 1 66 \
##  --time 10 --block-list  1 10 --verbose --out cucalln.dat --single-column 
##
##done
