#-----------------------------VARIABLES------------------------------
TOTAL=$1
TYPE=$(( TOTAL % 2 ))

if [ "$TYPE" -eq 0 ];
    then
            echo "Input can't be even"
            exit 1
fi

MIDVAL=$(((TOTAL+1)/2))
RVRSFLG=0

if [ $(( (TOTAL-1)%4)) -eq 0 ]; then
    CHRTYPE=1
else
    CHRTYPE=0
fi

INSPCCOUNT=0
OUTSPCCOUNT=$(((TOTAL-1)/2))
INSPC=""
OUTSPC=""
#--------------------------------------------------------------------------

for (( column=1; column <= TOTAL; column++ ))
do
    #------------------------------ Print Space -------------------------------
    #--------------------------------------------------------------------------
    #Inner Space
    for ((i=1; i <= $INSPCCOUNT; i++))
    do
        INSPC=$INSPC" "
    done
    #Outer Space
    for ((o=1; o <= $OUTSPCCOUNT; o++))
    do
        OUTSPC=$OUTSPC" "
    done
    #-------------------------------------------------------------------------


    #----------------------------- Print Char -------------------------------
    if [ "$column" -eq "$TOTAL" -o "$column" -eq 1 ]; then
        echo "$OUTSPC""x"
    elif [ "$column" -eq "$MIDVAL" ];then
        echo "$OUTSPC""x""$INSPC""x"

    elif [ "$CHRTYPE" -eq 0 -o $(( $column % 2 )) -eq 0 ]; then
	echo "$OUTSPC""o""$INSPC""o"

    elif [  $((column % 2)) -eq 1 ]; then
        echo "$OUTSPC""x""$INSPC""x"

    else
        echo "error"
    fi

    OUTSPC=""
    INSPC=""

    if [ "$column" -eq "$MIDVAL" ]; then
        RVRSFLG=1
    fi

    if [ "$RVRSFLG" -eq 0 ]; then
        OUTSPCCOUNT=$(($OUTSPCCOUNT - 1 ))
        if [ "$INSPCCOUNT" -eq 0 ]; then
            INSPCCOUNT=$(( $INSPCCOUNT + 1 ))
        else
            INSPCCOUNT=$(( $INSPCCOUNT + 2 ))
        fi
    else
        OUTSPCCOUNT=$(( $OUTSPCCOUNT + 1 ))
        if [ "$INSPCCOUNT" -eq 0 ]; then
            INSPCCOUNT=$(( $INSPCCOUNT - 1 ))
        else
            INSPCCOUNT=$(( $INSPCCOUNT - 2 ))
        fi
    fi

done
