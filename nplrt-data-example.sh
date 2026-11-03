#!/bin/bash
#SBATCH --job-name=nplrt-data
#SBATCH --nodes=1
#SBATCH --array=1-6
#SBATCH --output=iotrash/array_job_%A_task_%a.out
#SBATCH --error=iotrash/array_job_%A_task_%a.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=ahudson@fredhutch.org

ml fhR 
Rscript nplrt-data-example.R
