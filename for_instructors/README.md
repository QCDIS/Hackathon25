# Documentation for instructors

**Here is documentation for the school instructors. The school participants are not expected to perform the steps described here.**

## Setting up Jupyter for courses on LUMI

Create the environment where notebooks are run (see [LUMI documentation](https://docs.lumi-supercomputer.eu/software/installing/container-wrapper/) for more information):

```bash
module load LUMI/24.03
module load lumi-container-wrapper
conda-containerize new --prefix /projappl/project_465001732/BioDT_School_Hackathon_env BioDT_School_Hackathon_env.yml
```

Create the course module (see [LUMI documentation](https://docs.lumi-supercomputer.eu/runjobs/webui/jupyter-for-courses/) for more information):

```bash
mkdir -p /projappl/project_465001732/www_lumi_modules
cp BioDT_School_Hackathon.lua BioDT_School_Hackathon-resources.yml /projappl/project_465001732/www_lumi_modules/
```

