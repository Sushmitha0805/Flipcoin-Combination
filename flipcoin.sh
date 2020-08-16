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

#doublet


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

#Flip coin for Triplet combination

while [[ $NUMBER_TRIPLET -le 20 ]]
do
   FLIP_CHECK=$(( RANDOM%2))
   FLIP_CHECK_ONE=$(( RANDOM%2))
   FLIP_CHECK_TWO=$(( RANDOM%2))
   if [[ $FLIP_CHECK -eq $HEAD && $FLIP_CHECK_ONE -eq $HEAD && $FLIP_CHECK_TWO -eq $HEAD ]]
   then
      COIN_FLIP="HHH"
      COUNT_4=$(( $COUNT_4+1 ))
	elif [[ $FLIP_CHECK -eq $HEAD && $FLIP_CHECK_ONE -eq $HEAD && $FLIP_CHECK_TWO -eq $TAIL ]]
   then
      COIN_FLIP="HHT"
      COUNT_5=$(( $COUNT_5+1 ))
	elif [[ $FLIP_CHECK -eq $HEAD && $FLIP_CHECK_ONE -eq $TAIL && $FLIP_CHECK_TWO -eq $HEAD ]]
   then
      COIN_FLIP="HTH"
      COUNT_6=$(( $COUNT_6+1 ))
	elif [[ $FLIP_CHECK -eq $TAIL && $FLIP_CHECK_ONE -eq $HEAD && $FLIP_CHECK_TWO -eq $HEAD ]]
   then
      COIN_FLIP="THH"
      COUNT_7=$(( $COUNT_7+1 ))
   elif [[ $FLIP_CHECK -eq $TAIL && $FLIP_CHECK_ONE -eq $TAIL && $FLIP_CHECK_TWO -eq $TAIL ]]

   then
      COIN_FLIP="TTT"
      COUNT_8=$(( $COUNT_8+1 ))
 	elif [[ $FLIP_CHECK -eq $TAIL && $FLIP_CHECK_ONE -eq $TAIL && $FLIP_CHECK_TWO -eq $HEAD ]]
   then
      COIN_FLIP="TTH"

      COUNT_9=$(( $COUNT_9+1 ))
	elif [[ $FLIP_CHECK -eq $TAIL && $FLIP_CHECK_ONE -eq $HEAD && $FLIP_CHECK_TWO -eq $TAIL ]]
   then
      COIN_FLIP="THT"
      COUNT_10=$(( $COUNT_10+1 ))
	else [[ $FLIP_CHECK -eq $HEAD && $FLIP_CHECK_ONE -eq $TAIL && $FLIP_CHECK_TWO -eq $TAIL ]]
      COIN_FLIP="HTT"
      COUNT_11=$(( $COUNT_11+1 ))

	fi
   Triplet[$NUMBER_TRIPLET]=$COIN_FLIP
   NUMBER_TRIPLET=$(( $NUMBER_TRIPLET+1 ))
   echo ${Triplet[@]}
done
LENGTH_ARRAYT=${#Triplet[@]}

HHH=$(echo | awk '{print '$COUNT_4/$LENGTH_ARRAYT*100'}')
	echo " Winning Percentage for Triplet Combination HHH " $HHH
HHT=$(echo | awk '{print '$COUNT_5/$LENGTH_ARRAYT*100'}')
	echo " Winning Percentage for Triplet Combination HHH " $HHT
HTH=$(echo | awk '{print '$COUNT_6/$LENGTH_ARRAYT*100'}')
	echo " Winning Percentage for Triplet Combination HTH " $HTH
THH=$(echo | awk '{print '$COUNT_7/$LENGTH_ARRAYT*100'}')
	echo " Winning Percentage for Triplet Combination THH " $THH
TTT=$(echo | awk '{print '$COUNT_8/$LENGTH_ARRAYT*100'}')
	echo " Winning Percentage for Triplet Combination TTT " $TTT
TTH=$(echo | awk '{print '$COUNT_9/$LENGTH_ARRAYT*100'}')
	echo " Winning Percentage for Triplet Combination TTH " $TTH
THT=$(echo | awk '{print '$COUNT_10/$LENGTH_ARRAYT*100'}')
	echo " Winning Percentage for Triplet Combination THT " $THT
HTT=$(echo | awk '{print '$COUNT_11/$LENGTH_ARRAYT*100'}')
	echo " Winning Percentage for Triplet Combination HHH " $HTT

Triplet_Array=($HHH $HHT $HTH $THH $HTT $THT $TTH $TTT)
echo ${Triplet_Array[@]}
