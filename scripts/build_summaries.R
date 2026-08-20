#!/usr/bin/env Rscript
#
# Build this site's profile-level summary parquet from the seastamp
# observation-level files. The work lives in reportlib::build_summaries();
# this only names the datasets.
#
# There is no GL dataset here: Copernicus does not provide the GL product for
# the Baltic Sea, so those pages were removed.
#
suppressPackageStartupMessages(library(reportlib))

args <- commandArgs(trailingOnly = TRUE)

build_summaries(
  datasets = list(
    list(src = "nrt_bo_bo", out = "netcdf_nrt_bo_2_summary"),
    list(src = "cora_bo",   out = "netcdf_cora_bo_2_summary")
  ),
  src_dir    = Sys.getenv("SEASTAMP_DIR", unset = "/scratch/data/aiqc/seastamp/stamped/depth"),
  out_dir    = Sys.getenv("SUMMARY_DIR",  unset = "/scratch/data/aiqc/merged"),
  chunk_rows = as.numeric(Sys.getenv("CHUNK_ROWS", unset = "15000000")),
  force      = "--force" %in% args,
  only       = setdiff(args, "--force")
)
message("done")
