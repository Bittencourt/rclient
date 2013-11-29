--[[ FIRST: 
start a local R session via Rserve, install the Rserve package via the R
package manager and use the following R code: 
    library(Rserve)
    Rserve()

Please refer to the Rserve documentation informations on how to use a different port number and/or enable remote connections. The following code snippet is intended to give an idea of the functionalities that are offered by this library.
--]]

local R = require "rclient"
 
local r = R.connect() -- Connect to a R session.
r "library(ggplot2)"  -- Load ggplot2 package.

local N = 1000
samples = torch.Tensor(N,2)
samples:select(2,1):copy(torch.rand(N,1))
samples:select(2,2):copy(torch.randn(N,1)):add(10)

r.samples = R.torchmatrix(samples, N, 2)   -- Transfer samples to R.
r "samples <- as.data.frame(samples)" -- Convert to data.frame.

-- Create and save the two histograms:
--[[
r "p1 <- ggplot(samples, aes(x = V1)) + geom_histogram()"
r "print(p1)"
r "ggsave(file = 'p1.png', plot = p1, width = 4, height = 4)"
r "p2 <- ggplot(samples, aes(x = V2)) + geom_histogram()"
r "print(p2)"
r "print(getwd())"
r "ggsave(file = 'p2.png', plot = p2, width = 4, height = 4)"
--]]
r [[p1 <- ggplot(samples, aes(x = V1)) + geom_histogram()
print(p1)
ggsave(file = 'p3.png', plot = p1, width = 4, height = 4)
p2 <- ggplot(samples, aes(x = V2)) + geom_histogram()
print(p2)
print(getwd())
ggsave(file = 'p4.png', plot = p2, width = 4, height = 4)
]]

