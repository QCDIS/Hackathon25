#!/bin/bash
#SBATCH --job-name=test           # Job name
#SBATCH --output=test-output.txt  # Job standard output file
#SBATCH --partition=small         # Partition name
#SBATCH --ntasks=1                # Number of MPI tasks
#SBATCH --cpus-per-task=1         # Number of cores per task
#SBATCH --time=00:00:01           # Run time (hh:mm:ss)

# Write the executed commands after the #SBATCH directives

# Srun launches a job step within the allocation
srun python3 --version
srun python3 script.py
