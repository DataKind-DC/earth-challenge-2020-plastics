# Earth Challenge 2020

Earth Challenge 2020 seeks to engage millions of people in collecting, cataloguing, and integrating 1 billion interoperable, high quality data points in an API-enabled platform. All data points should advance research and support better individual decision-making and policy action; the platform should offer open data access, educational resources, “What You Can Do” materials, and data visualization tools to make it accessible to any citizen scientist.

The global project calls to action anyone who wishes to contribute to the ideal of increasing the amount of open and interoperable citizen science data. A set of 6 critical environmental questions should guide how to prioritize data collection and data integration activities.

To inform this data collection, DataKind's goal for the marine plastics pollution research question is as follows:

First, determine how difficult it is to harmonize existing citizen science data sets on marine and freshwater plastics pollution, and determine the quality of the data from different sources. Next, see which data sets can be integrated, and find where any gaps may be.  If possible, integrate citizen science data and/or pull in complementary information (e.g., data on plastics pollution from EOs) to help stakeholders like UN Environment understand how bad the problem of global plastics pollution really is.  Then, use this to inform the development of an app that citizen scientists can use around the world will use on Earth Day (and beyond) to collect high-value information on plastics pollutions, to help fill the gaps and support monitoring through the SDG framework.


### Plastics Pollution Citizen Science Data

1. [Marine Debris Monitoring and Assessment Project (MDMAP)](https://mdmap.orr.noaa.gov/login)

   MDMAP is a citizen science initiative that engages NOAA partners and volunteers across the nation to survey and record the amount and types of marine debris on shorelines.

   Each passionate and dedicated partner in the MDMAP network selects a nearby shoreline monitoring site that they return to monthly to conduct surveys and submit meaningful data to NOAA’s database.

   A published analysis of these data can be found in `background/NOAA_OC_Scientific_Report.pdf`

   Five types of reports they offer
   * Accumulation Report
   raw data: `data_raw/MDMAP_AccumulationReport_all_regions.csv`
   * Concentration Report - Plastic (seems to be a count), Plastic - Concentration, Plastic - Standard Deviation⋅⋅
   raw data: `data_raw/MDMAP_ConcentrationReport_all_regions.csv`
   * Custom Data Report
   raw data: `data_raw/MDMAP_CustomDataReport_all_regions.csv`
   * Large Item Report
   raw data: `data_raw/MDMAP_LargeItemReport_all_regions.csv`
   * Raw Standing Stock Report
   raw data: `data_raw/MDMAP_RawStandingStockReport_all_regions.csv`

2. [Ocean Conservancy TIDES Database](https://www.coastalcleanupdata.org/)

   The Ocean Conservancy TIDES database contains ocean trash data from the past years. 34,468,698 people have participated in the effort to collect data from 43,4321 locations worldwide; people have removed 300,589504 lbs of trash across 497,559 miles. People join the effort to collect data through International Coastal Cleanup and can enter data through paper data cards or through a mobile application.

   There are 7 reports for the country, state, and zone levels, and data exists for the years 2008-2015.

   There are approx ~60,000 observations in the Detailed Summary Report (found in `data_raw/TIDES_detailed_summary_earth.csv`)

3. [European Environment Agency's Marine LitterWatch](https://www.eea.europa.eu/themes/water/europes-seas-and-coasts/assessments/marine-litterwatch/data-and-results/marine-litterwatch-data-viewer/marine-litterwatch-data-viewer)

   Data collected by the Marine LitterWatch communities is made available as soon as it enters the EEA database without any further manual quality control. The users submitting the data are responsible for its accuracy.

   `data_raw/MarineLitterWatch_data.csv` contains the raw data, and `data_raw/MarineLitterWatch_meta.csv` contains the labels for the columns of the raw data.

4. [Global Microplastics Inititative](https://www.adventurescientists.org/microplastics.html)

   Recruiting, training and managing individuals with strong outdoor skills — such as mountaineering, diving or whitewater kayaking — to collect research-grade data through detailed protocols.

   Provides location, name of person who observed data, team members, sample ID, plastics per liter (PPL)

   Three types of data:
   * WW Freshwater Data (`data_raw/Microplastics_WWFreshwaterDatashare.xlsx`)
   * WW Marine Data (`data_raw/Microplastics_WWMarineDatashare.xlsx`)
   * Gallatin Data (`data_raw/Microplastics_GallatinDatashare.xlsx`)


### The Latest Post-Processed Data Files

**Marine Debris Categories**

For datasets 1-3, the specific column names indicating the type of item picked up (e.g., plastic soda bottle) have been mapped to Marine Debris Categories: `Plastic`, `Fishing Gear`, `Metal`, `Rubber`, `Glass`, `Cloth`, `Processed Lumber`, and `Other`. This mapping can be found in CSV format (`category_map.csv`) as well as dictionary format (`column_to_category_dict.json`).

**MDMAP Accumulation Data**

DATA CLEANING: Added a `unique_id` column to make it easier to link later analyses to the initial data upload to ArcGIS. For a plastics per square meter visualization, we computed the total area (in sq. meters) of each beach using the `length` and `width` info and removed the 7 observations with area = 0. The processing code is located at `mdmap_accumulation_totalarea.ipynb` and the resulting file is saved at `data_processed/mdmap_accumulation_totalarea_zerosremoved.csv`

CATEGORY COUNTS: We computed the total items collected per Marine Debris Category, as well as the total items per category per square meter.  The processing code is located at `mdmap_totals_by_category.ipynb` and the data is saved at `data_processed/mdmap_totals_by_category.csv`.

**TIDES Data**

DATA CLEANING: Split the GPS coordinates into separate columns for Latitude and Longitude.  In addition, a new column was added to express beach length in terms of meters rather than miles (to harmonize with MDMAP and Marine LitterWatch). This latest data is saved at `data_processed/TIDES_detailed_summary_earth_cleaned.csv`.

CATEGORY COUNTS: We computed the total items collected per Marine Debris Category, as well as the total items per category per square meter.  The processing code is located at `TIDES_totals_by_category.ipynb` and the data is saved at `data_processed/TIDES_earth_totals_by_category.csv`.

**Marine LitterWatch Data**

CATEGORY COUNTS: The Marine LitterWatch data columns were summed by Marine Debris Category and this result is saved at `data_processed/MarineLitterWatch_totals_by_category.csv`. It would be good to check the results by using a pipeline similar to what was done in `mdmap_totals_by_category.ipynb`.
