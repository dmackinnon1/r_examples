
# Generates an image similar to a "Chlandi Figure." Chlandi Figures are nodal patterns
# that occur on vibrating surfaces.

# The surface is modeled as a matrix, each point representing the 
# displacement of the surface while vibrating.
# The vibration is modled as the sum of a set of terms, each of which
# is a product of sin waves - one along the x direction, one along the y direction.
# The sin wave terms have different frequencies - starting with the 
# 'fundamental' frequency (wavelength is 1/2 the length of the surface),
# and followed by various 'harmonics'. 

t <- 0:500
f <- 2*pi/500
i <- 0
Chlandi  <- 0:500 * 0 # first row is zero, as sin(0) = 0

# Now add 500 more rows, first factor in each term varies as we go across a row (from t)
# second factor of each term varies as we go down a column (from i)
for ( i in 1:500) { 
  Chlandi  <- rbind(Chlandi , # comment out different factors below to generate
                              # a variety of images
                    #+ sin(1/2*f*t)*sin(1/2*f*i) 
                    + sin(f*t)*sin(f*i)  
                    #+ sin(3/2*f*t)*sin(3/2*f*i)  
                    #+ sin(2*f*t)*sin(2*f*i)
                    #+ sin(5/2*f*t)*sin(5/2*f*i)
                    + sin(3*f*t)*sin(3*f*i)
                    + sin(7/2*f*t)*sin(7/2*f*i)
                    #+ sin(4*f*t)*sin(4*f*i)
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