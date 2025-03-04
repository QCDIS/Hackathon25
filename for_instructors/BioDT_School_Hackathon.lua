-- Jupyter
-- depends_on("module1", "module2")
local project = "project_465001732"
local projdir = pathJoin("/projappl", project)
local workdir = pathJoin("/scratch", project, os.getenv("USER"))
local basename = "BioDT"
local userenvdir = pathJoin(workdir, basename, "env")

setenv("BIODT_USER_ENV", userenvdir)
setenv("PYTHONUSERBASE", pathJoin(userenvdir, "Python"))
setenv("R_LIBS_USER", pathJoin(userenvdir, "R"))

-- Clean old user environment
execute {cmd="rm -rf \"$BIODT_USER_ENV\"; mkdir -p \"$PYTHONUSERBASE\" \"$R_LIBS_USER\"", modeA={"load"}}

-- Search for the latest env and add it to the path
execute {cmd="export BIODT_ENV=$(ls -d " .. projdir .. "/BioDT_School_Hackathon_env/v* | tail -n 1); export PATH=$BIODT_ENV/bin:$PATH", modeA={"load"}}

setenv("_COURSE_BASE_NAME", basename)
setenv("_COURSE_NOTEBOOK", "Hackathon25/start_here.ipynb")
setenv("_COURSE_GIT_REPO", "https://github.com/BioDT/Hackathon25.git")
setenv("_COURSE_GIT_REF", "")

-- lab / notebook / empty (defaults to jupyter)
setenv("_COURSE_NOTEBOOK_TYPE", "lab")

-- Clean slurm environment variables so that sbatch works from jupyter
unsetenv("SLURM_MEM_PER_NODE")
unsetenv("SLURM_EXPORT_ENV")
unsetenv("SLURM_JOB_RESERVATION")
unsetenv("SLURM_NODEID")
unsetenv("SLURM_TASK_PID")
unsetenv("SLURM_PRIO_PROCESS")
unsetenv("SLURM_SUBMIT_DIR")
unsetenv("SLURM_CPUS_PER_TASK")
unsetenv("SLURM_PROCID")
unsetenv("SLURM_JOB_GID")
unsetenv("SLURM_JOB_END_TIME")
unsetenv("SLURM_TASKS_PER_NODE")
unsetenv("SLURM_NNODES")
unsetenv("SLURM_GET_USER_ENV")
unsetenv("SLURM_JOB_START_TIME")
unsetenv("SLURM_JOB_NODELIST")
unsetenv("SLURM_CLUSTER_NAME")
unsetenv("SLURM_NODELIST")
unsetenv("SLURM_JOB_CPUS_PER_NODE")
unsetenv("SLURM_THREADS_PER_CORE")
unsetenv("SLURM_TOPOLOGY_ADDR")
unsetenv("SLURM_WORKING_CLUSTER")
unsetenv("SLURM_JOB_NAME")
unsetenv("SLURM_JOBID")
unsetenv("SLURM_CONF")
unsetenv("SLURM_NODE_ALIASES")
unsetenv("SLURM_JOB_QOS")
unsetenv("SLURM_TOPOLOGY_ADDR_PATTERN")
unsetenv("SLURM_CPUS_ON_NODE")
unsetenv("SLURM_JOB_NUM_NODES")
unsetenv("SLURM_JOB_UID")
unsetenv("SLURM_JOB_PARTITION")
unsetenv("SLURM_HINT")
unsetenv("SLURM_JOB_USER")
unsetenv("SLURM_SUBMIT_HOST")
unsetenv("SLURM_JOB_ACCOUNT")
unsetenv("SLURM_GTIDS")
unsetenv("SLURM_JOB_ID")
unsetenv("SLURM_LOCALID")

-- Use the same project code for job submissions
setenv("SLURM_ACCOUNT",  project)
setenv("SBATCH_ACCOUNT", project)
setenv("SALLOC_ACCOUNT", project)
