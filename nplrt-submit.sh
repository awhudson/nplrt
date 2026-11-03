#!/bin/bash
#SBATCH --job-name=nplrt
#SBATCH --nodes=1
#SBATCH --array=1-500
#SBATCH --output=iotrash/array_job_%A_task_%a.out
#SBATCH --error=iotrash/array_job_%A_task_%a.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ahudson@fredhutch.org

ml fhR 
Rscript nplrt-vimp-sims.R
