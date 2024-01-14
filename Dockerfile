# Dockerfile: Image for Linguistics 380
# About: extends rocker/tidyverse with
#  - libxt6 (for Cairo), and spacyr dependencies
#  - TinyTex
#  - sudo for rstudio user
#  - R packages
#  - RStudio preferences
#  - Lessons directory

# Pull base image
FROM rocker/tidyverse:latest

# Update/ install apt-get packages
RUN apt-get -y update && \
    apt-get -y install \
    libxt6 \
    zlib1g-dev \
    libpng-dev \
    python3 && \
    rm -rf /var/lib/apt/lists/*

# Do not run as root
USER rstudio

# Install TinyTex
RUN quarto install tinytex

# Return to root
USER root

# Allow rstudio user to have sudo
ENV ROOT=true

# Install R packages
COPY install_packages.R /tmp/install_packages.R
RUN Rscript /tmp/install_packages.R

# Copy/ permissions RStudio prefs
COPY rstudio-prefs.json /home/rstudio/.config/rstudio/rstudio-prefs.json
RUN chown rstudio:rstudio /home/rstudio/.config/rstudio/rstudio-prefs.json

# Copy/ permissions Lessons/ directory
COPY Lessons /home/rstudio/Lessons
RUN chown -R rstudio:rstudio /home/rstudio/Lessons
