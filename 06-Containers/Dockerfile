ARG CONDA_VERSION=24.11.3-2

FROM docker.io/opensuse/leap:15.4 AS base

# Install general utilities:
#   - R depends on which
#   - R help needs less
#   - r-devtools needs tar etc
RUN zypper refresh && \
    zypper --non-interactive install \
    	which less \
    	tar gzip unzip \
    	&& \
    zypper clean --all

# Install conda
ARG CONDA_VERSION
RUN curl -L "https://github.com/conda-forge/miniforge/releases/download/$CONDA_VERSION/Miniforge3-$CONDA_VERSION-Linux-x86_64.sh" -o conda.sh && \
	bash conda.sh -b -p /conda/conda && \
	rm conda.sh && \
	/conda/conda/bin/conda clean -afy

# Create base R environment
ARG R_VERSION
RUN . /conda/conda/etc/profile.d/conda.sh && \
	conda create -p /conda/env -c conda-forge --override-channels --no-default-packages \
    	r-base=$R_VERSION \
    	&& \
	/conda/conda/bin/conda clean -afy

# Install R packages
RUN . /conda/conda/etc/profile.d/conda.sh && \
    conda activate /conda/env && \
    conda install -c conda-forge --override-channels \
        r-devtools \
        r-codetools \
        r-terra \
        && \
    /conda/conda/bin/conda clean -afy

ENV PROJ_DATA=/conda/env/share/proj \
	PATH=/conda/env/bin:$PATH \
	R_KEYRING_BACKEND=env \
	LC_ALL=C.UTF-8

ENTRYPOINT ["Rscript"]
CMD ["--help"]
