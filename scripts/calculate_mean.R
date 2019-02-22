# Set the data directory as a constant
dataDir = 'data'

# Read in the data
data = scan(file.path(dataDir, 'gaussian_data.txt'))

# Compute the observed mean of the data
observedMean = mean(data)

# Write the observed mean to a file in the data directory
write(file = file.path(dataDir, 'observed_mean.txt'), observedMean)
