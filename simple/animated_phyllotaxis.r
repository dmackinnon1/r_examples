# A first example using the anim.plots library
# > install.packages('anim.plots')
# Install the anim.plots package using the line above before running the script below. 
# Plots 100 frames of 100 points of phyllotaxis-like spirals.
library('anim.plots')
t <- 1:100
p <- (1 + sqrt(5))*pi
x <- NULL
y <- NULL
for (i in 1:100) {
  x <- c(x, sqrt(t)*cos(p*t*i/100))
  y <- c(y, sqrt(t)*sin(p*t*i/100))
}
anim.plot(x, y, times=100, type="p", axes=FALSE)
