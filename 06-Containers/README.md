# Hackathon: Containers in a BioDT way

This is a minimal demo on containers as they are set up and used in BioDT.

## Building a new image

Build a new image using `Dockerfile` and tag it as `test:0.1.0`:

    docker buildx build --platform linux/amd64 --build-arg R_VERSION=4.3.3 -t test:0.1.0 .

Run an R script using the container:

    docker run --rm -it -v "$PWD:/work:Z" -w "/work" test:0.1.0 test.R

## Pushing the image to GitHub Container Registry

Rebuild the image with a valid ghcr.io tag (`namespace` could be your GitHub username):

    docker buildx build --platform linux/amd64 --build-arg R_VERSION=4.3.3 -t ghcr.io/namespace/test:0.1.0 .

Follow [these instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token#creating-a-personal-access-token-classic)
and create a classic personal access token with scope 'write:packages'.

Login using this token in order to be able to push (username: your GitHub username, password: your token):

    docker login ghcr.io

Push the image:

    docker push ghcr.io/namespace/test:0.1.0

Then the image is available in 'Packages' tab of the corresponding GitHub user/organization,
as an example, see [BioDT Packages](https://github.com/orgs/BioDT/packages).

## Using the image on LUMI

Pull the pre-built image on LUMI (if image is private, login is needed with a token with scope 'read:packages'):

    singularity pull --disable-cache --docker-login docker://ghcr.io/namespace/test:0.1.0

This creates a singularity image file `test_0.1.0.sif`.

Run an R script using the container:

    singularity run --bind "$PWD" test_0.1.0.sif test.R

To start using HPC resources, use the same singularity command in the sbatch script.
See [CWR pDT](https://github.com/BioDT/uc-CWR) for a complete example running HyperQueue using singularity containers.

