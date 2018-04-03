# A first example using the anim.plots library
# > install.packages('anim.plots')
# Install the anim.plots package using the line above before running the script below. 
# Plots 100 frames of 100 points of phyllotaxis-like spirals.
library('anim.plots')
t <- 1:100
p <- (1 + sqrt(5))*pi*10
x <- NULL
y <- NULL
frames <- 100
for (i in 1:frames) {
  x <- c(x, sqrt(t)*cos(p*t/i))
  y <- c(y, sqrt(t)*sin(p*t/i))
}
anim.plot(x, y, times=frames, type="p",speed=20, axes=FALSE)
