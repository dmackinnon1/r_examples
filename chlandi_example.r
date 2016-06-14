# Generates an image similar to a "Chlandi Figure." Chlandi Figures are nodal patterns
# that occur on vibrating surfaces.

t <- 0:100
f <- 2*pi/100
Chlandi  <- sin(1/2*f*t)*sin(1/2*f*0) + sin(f*t)*sin(f*0) + 2*sin(2*f*t)*sin(2*f*0)

for ( i in 1:100) {
  Chlandi  <- rbind(Chlandi , sin(1/2*f*t)*sin(1/2*f*i) + sin(f*t)*sin(f*i) + 2*sin(2*f*t)*sin(2*f*i) 
  )
}
par(mfrow=c(1,1))

# un comment out one of the below to display 
#image(Chlandi , col=topo.colors(100))
contour(Chlandi)