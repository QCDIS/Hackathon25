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
setenv("_COURSE_NOTEBOOK", "Hackathon25/README.ipynb")
setenv("_COURSE_GIT_REPO", "https://github.com/BioDT/Hackathon25.git")
setenv("_COURSE_GIT_REF", "")

-- lab / notebook / empty (defaults to jupyter)
setenv("_COURSE_NOTEBOOK_TYPE", "lab")

-- Clean slurm environment variables so that sbatch works from jupyter
unsetenv("SLURM_MEM_PER_NODE")
unsetenv("SLURM_EXPORT_ENV")

-- Use the same project code for job submissions
setenv("SLURM_ACCOUNT",  project)
setenv("SBATCH_ACCOUNT", project)
setenv("SALLOC_ACCOUNT", project)
