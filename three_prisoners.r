#
# Three Prisoners Simulation
# R script
# 
# This script sets up a data frame consistig of trials of the "Three Prisoners Problem."
# To be compared with "Monty Hall"

# first we decide how many trials to include in the simulation
n <- 1:1000
ThreePrisoners <- data.frame(n)

# for each trial, a prisoner is selected for pardoning
for (i in n) { ThreePrisoners$Pardoned[i] <- sample(c('A','B','C'),1) }

# for each trial, one prisoner goes to see the warden
for (i in n) { ThreePrisoners$VisitsWarden[i] <- sample(c('A','B','C'),1) }

# we will keep track to see if the prisoner that has gone to see the warden  
# was the one selected for pardoning
ThreePrisoners$VisitorPardoned <- ThreePrioners$Pardoned == ThreePriooners$VisitsWarden

# The Warden will tell which prisoner is pardoned ... or not
for (i in n) {
  if(ThreePrisoners$VisitorPardoned[i]){
    ThreePrisoners$SaidExecuted[i] <-  sample(c('A','B'.,'C')[- which(c('A','B','C') == ThreePrisoners$Pardoned[i])],1)
  } else {
    t <- c('A','B','C')[-which(c('A','B','C')==ThreePrisoners$VisitsWarden[i])]; 
    ThreePrisoners$SaidExecuted[i] <- t[-which(t==ThreePrisoners$Pardoned[i])]
  }
}

