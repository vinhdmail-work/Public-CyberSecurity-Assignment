#!/bin/bash;
#First agument is the Filename to search in the format 0000, and second argument is the time to be searched in the format 00:00:00:AM




echo "Please run this in the directory with the files containining the dealer roster"
echo "Please enter in  the date in the format 0000:"
read datefile

echo "Please enter in the time in the format 00:00:00AM"
read timelocation

echo -n "Enter either 1, 2, or 3 for Blackjack, Roulette, or Texas dealer, respectively:" 
read dealerchoice

if [ $dealerchoice = 1 ]
then
sed 's/ //' $datefile* | grep $timelocation | awk -F" " '{print "Roulette Dealer: "$2" "$3}'
exit
fi


if [ $dealerchoice = 2 ]
then
sed 's/ //' $datefile* | grep $timelocation | awk -F" " '{print "Roulette Dealer: "$4" "$5}'
exit
fi

if [ $dealerchoice = 3 ]
then
sed 's/ //' $datefile* | grep $timelocation | awk -F" " '{print "Roulette Dealer: "$6" "$7}'
exit
fi

