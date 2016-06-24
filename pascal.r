#Pascal Triangle, displayed modulo some number (mod)

# Choose a size for the triangle, from 3 to 500-ish 
size <- 5

# Display modulo some other number, this will cause different
# triangle patterns. 2 works well, try also 7, 11 and 118 
mod <- 2

# Create an array of zeros
Pascal  <- rep(0,size)
for ( i in 1:size) { 
  Pascal  <- rbind(Pascal , rep(0,size))
}

# Initialize the first cell to be 1
Pascal[1,1] <- 1
# Visit every other cell, except in first row and column
# and apply Pascal's formula to generate the value for that 
for (i in 2:size) {
  for (j in 2:size) {
    Pascal[i,j] <- (Pascal[i-1,j] + Pascal[i-1,j-1]) %% mod
  }
}

#the number of colors used is based on the mod value
image(Pascal, col=grey.colors(mod, start=1, end=0))
