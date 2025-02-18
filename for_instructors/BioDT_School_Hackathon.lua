-- Jupyter
-- depends_on("module1", "module2")
local project = "project_465001732"
local envdir = pathJoin("/projappl", project, "BioDT_School_Hackathon_env")
local workdir = pathJoin("/scratch", project, os.getenv("USER"))
local basename = "BioDT"

prepend_path("PATH", pathJoin(envdir, "bin"))
setenv("PYTHONUSERBASE", pathJoin(workdir, basename, "env", "Python"))
setenv("R_LIBS_USER", pathJoin(workdir, basename, "env", "R"))

execute {cmd="mkdir -p \"$PYTHONUSERBASE\"", modeA={"load"}}
execute {cmd="mkdir -p \"$R_LIBS_USER\"", modeA={"load"}}

setenv("_COURSE_BASE_NAME", basename)
setenv("_COURSE_NOTEBOOK", "Hackathon25/README.ipynb")
setenv("_COURSE_GIT_REPO", "https://github.com/BioDT/Hackathon25.git")
setenv("_COURSE_GIT_REF", "")

-- lab / notebook / empty (defaults to jupyter)
setenv("_COURSE_NOTEBOOK_TYPE", "lab")
