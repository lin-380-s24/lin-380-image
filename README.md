# Dockerfile: Image for Linguistics 380

[![Docker Build and Push to Docker Hub](https://github.com/lin-380-s24/lin-380-image/actions/workflows/docker-hub.yml/badge.svg)](https://github.com/lin-380-s24/lin-380-image/actions/workflows/docker-hub.yml)

This image extends `rocker/tidyverse` ([about base image](https://rocker-project.org/images/versioned/rstudio.html)) with:

- libxt6 (for Cairo), and spacyr dependencies
- TinyTex
- sudo for rstudio user
- R packages
- RStudio preferences
- Lessons directory
