library(ggplot2)

# Set the data and results directories as constants
dataDir = 'data'
resultsDir = 'results'

# Read in the data
data = read.table(file.path(dataDir, 'gaussian_data.txt'), col.names = 'raw')

# Read in the observed mean and standard deviation
observedMean = scan(file.path(dataDir, 'observed_mean.txt'))
observedSd   = scan(file.path(dataDir, 'observed_sd.txt'))

# Define the gaussian pdf
gauss = function(x, mean = 0, sd = 1) {
  return((1 / sqrt(2 * pi * sd^2)) * exp(-((x - mean)^2) / (sd^2)))
}

xVals = seq(-10, 10, 0.1)
expectedGauss = data.frame(x = xVals,
                           y = gauss(xVals,
                                     mean = observedMean,
                                     sd = observedSd))

analysis = ggplot() +
  geom_histogram(data = data, aes(x = raw, y = ..density..)) +
  geom_line(data = expectedGauss, aes(x = x, y = y)) +
  scale_x_continuous(limits = c(-10, 10)) +
  labs(x = 'Sampled Value', y = 'Probability')

ggsave(file.path(resultsDir, 'analysis.png'), plot = analysis,
       height = 4, width = 4)
