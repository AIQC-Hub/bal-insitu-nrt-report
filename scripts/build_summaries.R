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
repo <- normalizePath(file.path(dirname(sub("^--file=", "",
          grep("^--file=", commandArgs(FALSE), value = TRUE)[1])), ".."))
cfg  <- yaml::read_yaml(file.path(repo, "config.yml"))$data

build_summaries(
  datasets = list(
    list(src = "nrt_bo_bo", out = "netcdf_nrt_bo_2_summary"),
    list(src = "cora_bo",   out = "netcdf_cora_bo_2_summary")
  ),
  src_dir    = Sys.getenv("SEASTAMP_DIR", unset = cfg$seastamp_dir),
  out_dir    = Sys.getenv("SUMMARY_DIR",  unset = cfg$summary_dir),
  chunk_rows = as.numeric(Sys.getenv("CHUNK_ROWS", unset = "15000000")),
  force      = "--force" %in% args,
  only       = setdiff(args, "--force")
)
message("done")
