#!/bin/bash;
#First agument is the Filename to search, and second argument is the time to be searched in the format 00:00:00:AM

sed 's/ //' $1 | grep $2 | awk -F" " '{print "Roulette Dealer: "$4" "$5}' >> Dealers_working_during_losses

