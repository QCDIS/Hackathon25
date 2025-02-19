-- Jupyter
-- depends_on("module1", "module2")
local project = "project_465001732"
local projdir = pathJoin("/projappl", project)
local workdir = pathJoin("/scratch", project, os.getenv("USER"))
local basename = "BioDT"

setenv("PYTHONUSERBASE", pathJoin(workdir, basename, "env", "Python"))
setenv("R_LIBS_USER", pathJoin(workdir, basename, "env", "R"))

execute {cmd="mkdir -p \"$PYTHONUSERBASE\"", modeA={"load"}}
execute {cmd="mkdir -p \"$R_LIBS_USER\"", modeA={"load"}}

-- Search for the latest env and add it to the path
execute {cmd="export PATH=$(ls -d " .. projdir .. "/BioDT_School_Hackathon_env/v* | tail -n 1)/bin:$PATH; echo PATH=$PATH", modeA={"load"}}

setenv("_COURSE_BASE_NAME", basename)
setenv("_COURSE_NOTEBOOK", "Hackathon25/README.ipynb")
setenv("_COURSE_GIT_REPO", "https://github.com/BioDT/Hackathon25.git")
setenv("_COURSE_GIT_REF", "")

-- lab / notebook / empty (defaults to jupyter)
setenv("_COURSE_NOTEBOOK_TYPE", "lab")
