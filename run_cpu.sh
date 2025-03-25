#!/bin/bash
#SBATCH -N1
#SBATCH -p ndl
#SBATCH --time 00:10:00
#SBATCH --gres=gpu:4
#SBATCH --exclusive
#SBATCH --switches=3

set -x

ulimit -s unlimited
export OMP_STACK_SIZE=4G
export OMP_NUM_THREADS=1

cd $SLURM_SUBMIT_DIR

#/home/gmap/mrpm/cossevine/cucalln2_loki/compile.cpu_intel_d/main_cucalln_mf.x \
#  --case-out . \
#  --ngpblks 1 \
#  --case-in /scratch/work/cossevine/tmp/cucalln/000001 \
#  --verbose --diff --method openmp

/home/gmap/mrpm/cossevine/cucalln2_loki/compile.cpu_intel_d/main_cucalln_mf.x \
  --case-out . \
  --ngpblks 1 \
  --case-in /scratch/work/cossevine/tmp/cucalln/000001 \
  --verbose --diff --method openmp \
  --times 2 \
#/home/gmap/mrpm/cossevine/cucalln2_loki/compile.cpu_intel_d/main_cucalln_mf.x \
#  --case-out . \
#  --case-in /scratch/work/cossevine/tmp/cucalln/000001 \
#  --verbose --method openmp

