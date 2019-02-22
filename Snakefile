rule all:
  input:
    'data/gaussian_data.txt',
    'data/observed_mean.txt',
    'data/observed_sd.txt',
    'results/analysis.png'

rule generate_data:
  input:
    'scripts/generate_data.R',
    'params/parameters.yaml'
  output:
    'data/gaussian_data.txt'
  shell:
    'Rscript {input[0]}'

rule calculate_mean:
  input:
    'scripts/calculate_mean.R',
    'data/gaussian_data.txt'
  output:
    'data/observed_mean.txt'
  shell:
    'Rscript {input[0]}'

rule calculate_sd:
  input:
    'scripts/calculate_sd.R',
    'data/gaussian_data.txt'
  output:
    'data/observed_sd.txt'
  shell:
    'Rscript {input[0]}'

rule plot_observed_data:
  input:
    'scripts/plot_observed_data.R',
    'data/gaussian_data.txt',
    'data/observed_mean.txt',
    'data/observed_sd.txt'
  output:
    'results/analysis.png'
  shell:
    'Rscript {input[0]}'
