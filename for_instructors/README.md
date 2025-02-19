# Documentation for instructors

**Here is documentation for the school instructors. The school participants are not expected to perform the steps described here.**

## Setting up Jupyter for courses on LUMI

Create the environment where notebooks are run (see [LUMI documentation](https://docs.lumi-supercomputer.eu/software/installing/container-wrapper/) for more information):

```bash
module load LUMI/24.03
module load lumi-container-wrapper
# Check existing environments
ls -d /projappl/project_465001732/BioDT_School_Hackathon_env_v*
# Increment the version number vXXX below
conda-containerize new --prefix /projappl/project_465001732/BioDT_School_Hackathon_env_vXXX BioDT_School_Hackathon_env.yml
```

Create the course module (see [LUMI documentation](https://docs.lumi-supercomputer.eu/runjobs/webui/jupyter-for-courses/) for more information):

```bash
mkdir -p /projappl/project_465001732/www_lumi_modules
cp BioDT_School_Hackathon.lua BioDT_School_Hackathon-resources.yml /projappl/project_465001732/www_lumi_modules/
```


An initial Jupyter environment has been prepared on LUMI for the school and hackathon. In short, it works like this:

* Login to: [https://www.lumi.csc.fi](https://www.lumi.csc.fi/)
* Select "Jupyter for courses" app
* Select BioDT School and Hackathon project and course module (no other options available for students unless they are using LUMI already)
* Click Launch, wait, and then Connect to Jupyter
* This notebook opens: [https://github.com/BioDT/Hackathon25/blob/main/README.ipynb](https://github.com/BioDT/Hackathon25/blob/main/README.ipynb) (we can rename/modify this)

Under the hood, this clones the git repository [https://github.com/BioDT/Hackathon25/](https://github.com/BioDT/Hackathon25/) to the user's personal workspace on LUMI and executes Jupyter in the environment we have prepared. The Jupyter session has a default time limit of 4 hours (we can edit this as well as the number of CPUs and available RAM). Data is kept between different Jupyter sessions (once cloned repository won't be cloned or updated again - git pull needed for updating).

Currently, the environment is a conda environment with some basic Python and R packages (see **[environment.yml](https://github.com/BioDT/Hackathon25/blob/main/for_instructors/BioDT_School_Hackathon_env.yml "https://github.com/BioDT/Hackathon25/blob/main/for_instructors/BioDT_School_Hackathon_env.yml")).**We can modify this environment and add any packages we might need for running all the notebooks. Alternatively, it is also possible to define separate course modules and environments for different parts of the school/hackathon, but I feel it might be simpler for students to have only a single environment that contains everything they need. I added some technical documentation on this LUMI setup** **[here](https://github.com/BioDT/Hackathon25/tree/main/for_instructors "https://github.com/BioDT/Hackathon25/tree/main/for_instructors").
