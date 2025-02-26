# Soil Moisture Building Block

The Soil Data Building Block is part of the BioDT Building Blocks collection. It can be found here: https://github.com/BioDT/general-soilgrids-soil-data/tree/main


### Sample usage script

**We will download and use [soil.ipynb](soil.ipynb) to generate data.**

The outputs will be `.txt` files in [Grassminds](https://www.ufz.de/index.php?en=48444) input data format.

The following output variables are generated for any given location:

- Silt vs Clay	vs Sand content in percentage    
- FC[V%]: Field Capacity, representing the soil moisture content at which the soil holds the maximum amount of water that plants can use. It’s expressed as a volume percentage.
- PWP[V%]: Permanent Wilting Point, indicating the soil moisture level below which plants cannot extract water, leading to wilting. This is also expressed as a volume percentage.
- POR[V%]: Porosity, denoting the total volume of pore spaces in the soil, which affects its ability to retain water and air. It’s expressed as a volume percentage.
- KS[mm/d]: Saturated Hydraulic Conductivity, measuring the ease with which water can move through saturated soil. It’s expressed in millimeters per day.

See the sample values for the Global Change Experiment Facility (GCEF) in the [soilDataPrepared/lat51.390427_lon11.876855__2020__soil.txt](soilDataPrepared/lat51.390427_lon11.876855__2020__soil.txt) file.

### HiHydroSoil 2.0

**HiHydroSoil 2.0** is a global dataset providing high-resolution soil moisture estimates. It builds upon the original HiHydroSoil dataset, integrating improved methodologies and updated data sources to enhance accuracy and usability. Developed by **FutureWater**, this dataset serves as a crucial resource for hydrological modeling, agricultural planning, and environmental monitoring.

## Features

- **High-Resolution Data**: Offers spatially detailed soil moisture information at a global scale.
- **Improved Accuracy**: Incorporates refined algorithms and updated satellite-derived inputs.
- **Time-Series Availability**: Enables tracking of soil moisture changes over time.
- **Applications**:
  - Precision agriculture
  - Drought monitoring
  - Water resource management
  - Climate change studies

### Applications and Benefits

HiHydroSoil 2.0 supports **data-driven decision-making** in water and land management. By providing reliable soil moisture estimates, it helps stakeholders optimize irrigation strategies, assess drought risks, and improve hydrological models.

For more details, visit the official project page: [FutureWater - HiHydroSoil 2.0](https://www.futurewater.eu/projects/hihydrosoil/)

## Data Access

The HiHydroSoil 2.0 dataset is available for download through the BioDT OPeNDAP service. Users can remotely access and query the data in GeoTiFF format and integrate it into their applications or workflows. The full dataset is available on:  http://opendap.biodt.eu/grasslands-pdt/soilMapsHiHydroSoil/

### Variables and files


## Citation

When using the HiHydroSoil 2.0 dataset in your research or applications, please cite the following publication:

```
Simons, G.W.H., R. Koster, P. Droogers. 2020. 
HiHydroSoil v2.0 - A high resolution soil map of global hydraulic properties. 
FutureWater Report 213.
```