# Use the official pre-built R Docker image for version 3.5.2
# Their Dockerfile can be found here:
# https://github.com/rocker-org/rocker/blob/a7ecee9111f3b5dde35555d338a0e30401f5c095/r-base/Dockerfile
FROM r-base:3.5.2

# Update the underlying Ubuntu OS, and install snakemake
RUN apt-get update -y && \
    apt-get install -y snakemake

# Install ggplot2 and yaml libraries into R
RUN Rscript -e 'install.packages(c("ggplot2", "yaml"))'

# Set the working directory for the project to /app
WORKDIR /app

# Copy everything from our terminal's current directory (the first dot)
# into the working directory, /app (the second dot)
COPY . .

# By default, the r-base Docker image will run the terminal command "R".
# We want to overwrite that, so it runs snakemake instead.
ENTRYPOINT [ "snakemake" ]
