#!/bin/bash -l
#SBATCH --job-name=hq_test        # Job name
#SBATCH --output=hq-output.txt    # Job standard output file
#SBATCH --partition=small         # Partition name
#SBATCH --nodes=1                 # Number of computer nodes
#SBATCH --ntasks-per-node=1       # Number of MPI tasks per node
#SBATCH --cpus-per-task=8         # Number of cores per task
#SBATCH --time=00:10:00           # Run time (hh:mm:ss)

# Start the server in the background
hq server start &

# Wait until the server has started
until hq job list &> /dev/null ; do sleep 1 ; done

# Start the workers in the background
srun --overlap --cpu-bind=none --mpi=none hq worker start \
    --manager slurm \
    --on-server-lost finish-running \
    --cpus="$SLURM_CPUS_PER_TASK" &

# Wait until all workers have started
hq worker wait "$SLURM_NTASKS"

# Submit different species in parallel
hq submit --each-line species_list.txt bash -c 'python3 hq_script.py "$HQ_ENTRY"'

# Wait for all tasks to finish
hq job wait all

# Shut down the workers and server
hq worker stop all
hq server stop