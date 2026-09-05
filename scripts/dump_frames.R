#!/usr/bin/env Rscript
#
# Fingerprint every data frame this site's pages load. The work lives in
# reportlib::fingerprint_frames(); this only names the datasets.
#
suppressPackageStartupMessages(library(reportlib))

args <- commandArgs(trailingOnly = TRUE)
repo <- normalizePath(file.path(dirname(sub("^--file=", "",
          grep("^--file=", commandArgs(FALSE), value = TRUE)[1])), ".."))
cfg  <- yaml::read_yaml(file.path(repo, "config.yml"))$data

ok <- fingerprint_frames(
  datasets = list(
    bo      = list(common = "common_bo.Rmd",      vars = c("temp", "psal", "pres")),
    bo_cora = list(common = "common_bo_cora.Rmd", vars = c("temp", "psal", "pres"))
  ),
  func_dir = file.path(repo, "content", "_func"),
  data_dir = Sys.getenv("ARC_DATA_DIR", unset = cfg$summary_dir),
  out_dir  = file.path(repo, "tests", "fingerprints"),
  check    = "--check" %in% args
)
quit(status = if (isTRUE(ok)) 0L else 1L)
