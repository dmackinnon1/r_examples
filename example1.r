#http://www.mathrecreation.com/2015/08/simple-fun-with-r.html

#example 1a plotting the sin function
t <- 1:1000
f <- pi/100
plot(sin(f*t))

#example 1b plotting a circle
t <- 1:1000
f <- pi/100
plot(cos(f*t), sin(f*t), type="l")

#example 1c lissajous figure
t <- 1:1000
f <- pi/10
plot(cos(f*t/8), sin(f*t/6), axes=FALSE, type="l")
