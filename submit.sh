#!/bin/bash
#This is a batch submission script for SharC
#Request 4 cores from the scheduler
#$ -pe smp 4
# Request 3Gig of RAM per core so 12G in total
#$ -l rmem=3G
# Tell the scheduler to allow up to 1 day of wall clock time
#$ -l h_rt=24:00:00
# Request access to the rse queue. You have access to this because you are a collaborator of Marta Milo who has paid
#$ -P rse
#Request 7*71=497 unique jobs and give them indices 0 to 496
$ -t 0-496
echo "Task id is $SGE_TASK_ID"

export PATH=/data/md1lzc/miniconda3/bin:$PATH
source activate r-reticulate

# Construct the i,j for this SGE_TASK_ID
(( i = SGE_TASK_ID/71 + 1 ))
(( j = 1+(SGE_TASK_ID - (i-1)*71) ))
echo "$i $j"
Rscript ~/monika_install/Benchmarking_Clustering_Methods_scRNAseq_Luisa/benchmark/benchmark_dum_parallel.R $i $j --save

