library(yaml)

# Set the parameter and data directories as constants
dataDir = 'data'
paramsDir = 'params'

# Read the yaml parameter file in as a list
params = read_yaml(file.path(paramsDir, 'parameters.yaml'))

# Extract the relevant parameters (optional)
numSamples = params$numSamples
mean       = params$mean
sd         = params$sd

# Generate some data points from a Gaussian
data = rnorm(n = numSamples, mean = mean, sd = sd)

# Save the data points to a file in the results directory
write(file = file.path(dataDir, 'gaussian_data.txt'), data, ncolumns = 1)
