# Invasive Alien Species Digital Twin (IASDT) -- Data Streaming 

**Overview Paper:** [![DOI:10.1101/2024.07.23.604592](http://img.shields.io/badge/DOI-10.1101/2024.07.23.604592-323F23.svg)](https://doi.org/10.3897/rio.10.e124579) 

## Goal

The goal of this exercise is to familiarize yourself with the data streaming capabilities of the IASDT model outputs from the BioDT OPeNDAP server. The corresponding Jupyter notebook is available at [IASDT.ipynb]("IASDT-outputs.ipynb").  

## Background

The Invasive Alien Species Digital Twin (IASDT) is a digital twin that uses dynamic data-driven workflows for joint species distribution modelling of invasive alien species (IAS) in continental Europe with Hierarchical Modelling of Species Communities ([HMSC](https://www.helsinki.fi/en/researchgroups/statistical-ecology/software/hmsc)) models. The IASDT uses biotic and abiotic datasets to estimate the current and forecast the future distribution of IAS in Europe under various climate scenarios. The IASDT is part of the [Biodiversity Digital Twin (BioDT)](https://biodt.eu) project, which is funded by the European Union.

The workflows are written in Python and R, and are automated using the [PyDoit](https://pydoit.org) build automation tool. These workflows are meant to be executed on HPC systems, mainly [LUMI](https://lumi-supercomputer.eu). The workflows are designed to be modular and scalable based on the [TwinEco](#architectural-overview) framework. These workflows are designed to be used with the [OPeNDAP Cloud Server](#data-storage-and-availability) to serve data to third-party applications.

The IASDT is a part of the [BioDT](https://biodt.eu) project, which is funded by the European Union. 

## Model 

The IASDT uses the Hierarchical Modelling of Species Communities ([HMSC](https://www.helsinki.fi/en/researchgroups/statistical-ecology/software/hmsc)) model to estimate the current and forecast the future distribution of IAS in Europe under various climate scenarios. The HMSC model is a hierarchical Bayesian model that models the distribution of species based on environmental covariates. The IASDT uses the HMSC model to estimate the distribution of IAS in Europe based on biotic and abiotic datasets.
                                                                                                                                                              |
## Climate Scenarios

| Scenario specifier | Description                                   |   |
|--------------------|-----------------------------------------------|---|
| ssp126             | SSP1-RCP2.6 climate as simulated by the GCMs. |   |
| ssp370             | SSP3-RCP7 climate as simulated by the GCMs.   |   |
| ssp585             | SSP5-RCP8.5 climate as simulated by the GCMs. |   |

## Climate Models

| title              | model         | institution                                                                                                      | native resolution |
|--------------------|---------------|------------------------------------------------------------------------------------------------------------------|-------------------|
| [GFDL-ESM4](#)     | gfdl-esm4     | National Oceanic and Atmospheric Administration, Geophysical Fluid Dynamics Laboratory, Princeton, NJ 08540, USA | 288x180           |
| [UKESM1-0-LL](#)   | ukesm1-0-ll   | Met Office Hadley Centre, Fitzroy Road, Exeter, Devon, EX1 3PB, UK                                               | 192x144           |
| [MPI-ESM1-2-HR](#) | mpi-esm1-2-hr | Max Planck Institute for Meteorology, Hamburg 20146, Germany                                                     | 384x192           |
| [IPSL-CM6A-LR](#)  | ipsl-cm6a-lr  | Institut Pierre Simon Laplace, Paris 75252, France                                                               | 144x143           |
| [MRI-ESM2-0](#)    | mri-esm2-0    | Meteorological Research Institute, Tsukuba, Ibaraki 305-0052, Japan                                              | 320x160           |

## Model outputs aviable Data

The IASDT produces the following outputs:
- Estimated mean distribution of IAS species in Europe under current and multiple future climate scenarios
- Coefficients of variation maps per species.
- Standard deviation maps per species. 

