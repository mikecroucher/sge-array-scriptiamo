#!/bin/bash
#This is a batch submission script for SharC
#Request 16 cores from the scheduler
#$ -pe smp 16
# Request 3Gig of RAM per core so 48G in total
#$ -l rmem=3G
# Tell the scheduler to allow up to 4 days of wall clock time
#$ -l h_rt=96:00:00
# Request access to the rse queue. You have access to this because you are a collaborator of Marta Milo who has paid
#$ -P rse

export PATH=/data/md1lzc/miniconda3/bin:$PATH
source activate r-reticulate
for i in 1 2 3 4 5 6 7
do
        for j in  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71

        do
                    Rscript ~/monika_install/Benchmarking_Clustering_Methods_scRNAseq_Luisa/benchmark/benchmark_dum_parallel.R $i $j --save

        done
done
