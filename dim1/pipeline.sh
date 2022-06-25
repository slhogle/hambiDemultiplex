#!/usr/bin/bash

# Run pheniqs using estimated priors
pheniqs mux --config 03_estimate.json

# prior-adjusted config file
pheniqs-prior-api.py \
--report 04_estimate_report.json \
--configuration 02_sample.json \
> 05_adjusted.json


# split libraries on i5/i7 barcodes
pheniqs-io-api.py \
--split-library \
--configuration 05_adjusted.json \
--format bam \
> 06_adjusted_split.json


pheniqs mux --config 06_adjusted_split.json
