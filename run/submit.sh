#!/bin/bash

# submit from project directory !!!

#$ -S /bin/bash
#$ -N cc
#$ -q hel.q
#$ -l h_vmem=6G # job is killed if exceeding this
#$ -cwd
#$ -o ./log/$JOB_NAME.$TASK_ID.$JOB_ID
#$ -j y

export OPENBLAS_NUM_THREADS=1 # avoid multithreading in numpy
export MKL_NUM_THREADS=1
export NUMEXPR_NUM_THREADS=1
export OMP_NUM_THREADS=1

date

vargs=$(awk "NR==$(($SGE_TASK_ID + 1))" ./run/parameters.tsv)
echo "./exe/cc ${vargs[$id]}"

./exe/cc ${vargs[$id]}

date