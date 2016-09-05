#!/bin/bash
#SBATCH -p standard
#SBATCH -J behavioral_action
#SBATCH -o /scratch/mtanveer/out/baction_%j_%a
#SBATCH --mem-per-cpu=4gb
#SBATCH -t 23:00:00
#SBATCH -c 2
#SBATCH -a 0-10

module load anaconda
python sisc_wrapper.py -diff_thresh 1e-6 -Beta 0.2 -D 5 --pca -i "./Data/$1"
