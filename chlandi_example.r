# Generates an image similar to a "Chlandi Figure." Chlandi Figures are nodal patterns
# that occur on vibrating surfaces.
t <- 0:500
f <- 2*pi/500
i <- 0
Chlandi  <- 0:500 * 0 # first row is zero, as sin(0) = 0

# now add 500 more rows, first factor in each term varies as we go across a row (from t)
# second factor of each term varies as we go down a column (from i)
for ( i in 1:500) { 
  Chlandi  <- rbind(Chlandi , # comment out different factors below to generate
                              # a variety of images
                    + sin(1/2*f*t)*sin(1/2*f*i) 
                    + sin(f*t)*sin(f*i)  
                    # + sin(3*f*t)*sin(3*f*i)  
                    + sin(4*f*t)*sin(4*f*i)
                    + sin(5*f*t)*sin(5*f*i)
                    
  )
}
par(mfrow=c(1,1))

Chlandi <- abs(Chlandi)

# use the image or contour functions to display the results
image(Chlandi, col=grey.colors(40, start=0, end=1))
#contour(Chlandi)