# Chilandi 40b - similar to Chilandi's original figure 40b

# Generates an image similar to a "Chlandi Figure." Chlandi Figures are nodal patterns
# that occur on vibrating surfaces.

# The surface is modeled as a matrix, each point representing the 
# displacement of the surface while vibrating.
# The vibration is modled as the sum of a set of terms, each of which
# is a product of cos waves - one along the x direction, one along the y direction.
# The cos wave terms have different frequencies - starting with the 
# 'fundamental' frequency (wavelength is 1/2 the length of the surface),
# and followed by various 'harmonics'. 

t <- 0:500
f <- 2*pi/500
i <- 0
Chlandi  <- rep(1, 501) # first row is one, as cos(0) = 1

# Now add 500 more rows, first factor in each term varies as we go across a row (from t)
# second factor of each term varies as we go down a column (from i)
for ( i in 1:500) { 
  Chlandi  <- rbind(Chlandi , 
                    + cos(1/2*f*t)*cos(1/2*f*i) 
                    + cos(2*f*t)*cos(2*f*i)
                    + cos(5/2*f*t)*cos(5/2*f*i)
  )
}
# Reset the graph layout in case it was previously set elsewhere.
par(mfrow=c(1,1))

# We want the matrix to record just the displacement of each
# point, not whether it happens to be up or down - in a standing
# wave the non nodal areas oscillate between positive and negative.
# So just take the absolute value of each point.
Chlandi <- abs(Chlandi)

# use the image or contour functions to display the results
image(Chlandi, col=grey.colors(40, start=0, end=1))
#contour(Chlandi)