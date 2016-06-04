#
# Monty Hall Simulation 
# R script
# 
# This script sets up a data frame consistig of trials of the "Monty Hall Problem."

# first we decide how many trials to include in the simulation
n <- 1:1000
MontyHall <- data.frame(n)

# for each trial, a door is selected (by Monty) as the winner
for (i in n) { MontyHall$PrizeDoor[i] <- sample(1:3,1) }

# for each trial, a door is selected by the contestant
for (i in n) { MontyHall$FirstChoice[i] <- sample(1:3,1) }

# we will keep track to see if the contestant picked the winner, 
# but they are not told at this poin
MontyHall$SelectedWinner <- MontyHall$FirstChoice == MontyHall$PrizeDoor

# Monty will reveal that one of the other doors is a looser
for (i in n) {
  if(MontyHall$SelectedWinner[i]){
    MontyHall$RevealedDoor[i] <-  sample(c(1:3)[- which(c(1:3) == MontyHall$FirstChoice[i])],1)
  } else {
    t <- c(1:3)[-which(c(1:3)==MontyHall$FirstChoice[i])]; 
    MontyHall$RevealedDoor[i] <- t[-which(t==MontyHall$PrizeDoor[i])]
  }
}

# Does the contestant switch? lets say that its a 50percent chance
for (i in n) { MontyHall$SwitchChoice[i] <- sample(0:1,1) }

MontyHall$SwitchChoice <- as.logical(MontyHall$SwitchChoice)

# The final choice is either the first choice, or if there was a switch, it was neither
# the first choice or the revealed door.
for (i in n) {
    if (MontyHall$SwitchChoice[i]){ 
      t <- c(1:3)[-which(c(1:3)==MontyHall$FirstChoice[i])]; 
      MontyHall$FinalChoice[i] <- t[-which(t==MontyHall$RevealedDoor[i])]
    } else {
      MontyHall$FinalChoice[i] <- MontyHall$FirstChoice[i]
    }
}

# Now let's see who won
MontyHall$Winner <- MontyHall$FinalChoice == MontyHall$PrizeDoor
