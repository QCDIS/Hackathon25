# Documentation for instructors

**Here is documentation for the school instructors. The school participants are not expected to perform the steps described here.**

## Using the Jupyter environment on LUMI

Follow these steps:

* Login to [https://www.lumi.csc.fi](https://www.lumi.csc.fi/)
* Select "Jupyter for courses" app
* Select BioDT School and Hackathon project and course module (no other options available for students unless they are using LUMI already)
* Click Launch, wait, and then Connect to Jupyter
* This notebook opens: [start_here.ipynb](../start_here.ipynb) (we can rename/modify this)

Under the hood, this clones the present git repository to the user's personal workspace (`/scratch/project_465001732/$USER`) on LUMI and executes Jupyter in the prepared environment.
The Jupyter session has a default time limit of 4 hours and resources defined by [resources.yml](BioDT_School_Hackathon-resources.yml) (see below for updating this file on LUMI).
Data is kept between different Jupyter sessions (once cloned repository won't be cloned or updated again - git pull needed for updating).

Currently, the environment is a conda environment with some basic Python and R packages defined by [environment.yml](BioDT_School_Hackathon_env.yml) (see below for updating this file on LUMI).
We can modify this environment and add any packages we might need for running all the notebooks.

## Setting up and updating Jupyter for courses on LUMI

Create the environment where notebooks are run (see [LUMI documentation](https://docs.lumi-supercomputer.eu/software/installing/container-wrapper/) for more information):

```bash
module load LUMI/24.03
module load lumi-container-wrapper
# Check existing environments
ls -d /projappl/project_465001732/BioDT_School_Hackathon_env/v*
# Increment the version number vXXX below
conda-containerize new -r BioDT_School_Hackathon_req.txt BioDT_School_Hackathon_env.yml --post-install BioDT_School_Hackathon_post.sh --prefix /projappl/project_465001732/BioDT_School_Hackathon_env/vXXX
```

Create / update the course module (see [LUMI documentation](https://docs.lumi-supercomputer.eu/runjobs/webui/jupyter-for-courses/) for more information):

```bash
mkdir -p /projappl/project_465001732/www_lumi_modules
cp BioDT_School_Hackathon.lua BioDT_School_Hackathon-resources.yml /projappl/project_465001732/www_lumi_modules/
```
