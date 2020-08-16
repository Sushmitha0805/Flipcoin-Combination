#!/bin/bash 

IS_HEAD=1;
RANDOM_CHECK=$((RANDOM%2))

if [ $RANDOM_CHECK -eq $IS_HEAD ]
then
	echo " Flip coin is HEADS "
else
	echo " Flip coin is TAILS "
fi
