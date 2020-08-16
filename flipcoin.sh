#!/bin/bash -x

HEAD=1;
FLIP_CHECK=$((RANDOM%2))
NUM_OF_FLIPS=5
if [ $FLIP_CHECK -eq $HEAD ]
then
	echo " Flip coin is HEADS "
else
	echo " Flip coin is TAILS "
fi

while [[ $NUMBER -le $NUM_OF_FLIPS ]]
do
	FLIP_CHECK=$((RANDOM%2))

if [ $FLIP_CHECK -eq $HEAD ]
then
	COIN_FLIP="H"
	HEAD_CNT=$(( $HEAD_CNT+1 ))
else
	COIN_FLIP="T"
	TAIL_CNT=$(( $TAIL_CNT+1 ))
fi

	Singlet[$NUMBER]=$COIN_FLIP
	NUMBER=$(( $NUMBER+1 ))
	echo ${Singlet[@]}
done


HEAD_PERCENT=$(echo | awk '{print '$HEAD_CNT/$NUM_OF_FLIPS*100'}')
	echo " Winnig Percentage of Singlet Combination H = " $HEAD_PERCENT
TAIL_PERCENT=$(echo | awk '{print '$TAIL_CNT/$NUM_OF_FLIPS*100'}')
	echo " Winning Percentage of Singlet Combination T = " $TAIL_PERCENT

ARRAY_SINGLET=($HEAD_PERCENT $TAIL_PERCENT)
	echo ${ARRAY_SINGLET[@]}

while [[ $NUMBER_DOUBLET -le 10 ]]
do
   FLIP_CHECK_ONE=$((RANDOM%2))
	FLIP_CHECK_TWO=$((RANDOM%2))

if [[ $FLIP_CHECK_ONE -eq $HEAD || $FLIP_CHECK_TWO -eq $HEAD ]]
then
	COIN_FLIP="HH"
	COUNT=$(( $COUNT+1 ))
elif [[ $FLIP_CHECK_ONE -eq $HEAD || $FLIP_CHECK_TWO -eq $TAIL ]]
then
   COIN_FLIP="HT"
   COUNT_1=$(( $COUNT_1+1 ))
elif [[ $FLIP_CHECK_ONE -eq $TAIL || $FLIP_CHECK_TWO -eq $HEAD ]]
then
	COIN_FLIP="TH"
	COUNT_2=$(( $COUNT_2+1 ))
elif [[ $FLIP_CHECK_ONE -eq $TAIL || $FLIP_CHECK_TWO -eq $TAIL ]]
then
	COIN_FLIP="TT"
	COUNT_3=$(( $COUNT_3+1 ))
fi

   Doublet[$NUMBER_DOUBLET]=$COIN_FLIP
   NUMBER_DOUBLET=$(( $NUMBER_DOUBLET+1 ))
   echo ${Doublet[@]}
done


LENGTH_OF_ARRAY=${#Doublet[@]}

HH=$(echo | awk '{print '$COUNT/$LENGTH_OF_ARRAY*100'}')
	echo "Winning Percentage For Doublet Combination  HH = " $HH

HT=$(echo | awk '{print '$COUNT_1/$LENGTH_OF_ARRAY*100'}')
	echo "Winning Percentage For Doublet Combination  HT = " $HT

TH=$(echo | awk '{print '$COUNT_2/$LENGTH_OF_ARRAY*100'}')
   echo "Winning Percentage For Doublet Combination  TH = " $TH

TT=$(echo | awk '{print '$COUNT_3/$LENGTH_OF_ARRAY*100'}')
   echo "Winning Percentage For Doublet Combination  TT = " $TT

Doublet=($HH $HT $TH $TT)
echo ${Doublet[@]}
