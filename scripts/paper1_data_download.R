#### Preamble ####
# Purpose: Download data from opendatatoronto
# Author: Justin Teng
# Data: 02 February 2022
# Contact: just.teng@mail.utoronto.ca


#### Workspace setup ####

library(tidyverse)
library(opendatatoronto)

### Data Download ###
# From https://open.toronto.ca/dataset/police-annual-statistical-report-homicide/

# Datasets are grouped into packages that have multiple datasets 
# also callled 'resources' that are relevant to that topic.
# So we first look at the package using a unique key that 
# we obtain from the datasets webpage (see above)


# get all resources for this package
resources <- list_package_resources("7d72bbbe-8adc-4b36-8ad1-5359f1c7a9cc")

# We need the unique key from that list of resources
# There is only one resource and so get_resource() will load that.
# If there is more than one resource then need to either filter or specify
homocide <- resources %>% 
  get_resource()

### Save Data ###
write_csv(homocide, "inputs/data/homocide.csv")


