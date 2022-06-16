#CODE to Get ELEMENT DATA by ATOMIC NUMBER,NAME & SYMBOL.
#Regular Expressions:-
check_no='^[0-9]+$'
check_letter='^[a-zA-Z]{1,2}$'
check_word='^[a-zA-Z]+$'
#Variable to connect to database
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
#FETCH Data and Print
FETCH_AND_PRINT()
{
NAME=($($PSQL "select name from elements where atomic_number=$NUMBER"))
SYM=($($PSQL "select symbol from elements where atomic_number=$NUMBER"))
TYPE_ID=($($PSQL "select type_id from properties where atomic_number=$NUMBER"))
TYPE=($($PSQL "select type from types where type_id=$TYPE_ID"))
MASS=($($PSQL "select atomic_mass from properties where atomic_number=$NUMBER"))
BOILING_PT=($($PSQL "select boiling_point_celsius from properties where atomic_number=$NUMBER"))
MELTING_PT=($($PSQL "select melting_point_celsius from properties where atomic_number=$NUMBER"))
echo "The element with atomic number $NUMBER is $NAME ($SYM). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_PT celsius and a boiling point of $BOILING_PT celsius."
}
#Test if argument is provided to code
if [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
#Check if automic number is provided as argument.
elif [[ $1 =~ $check_no ]]
then
  check_db=($($PSQL "select atomic_number from elements where atomic_number=$1"))
  if [[ -z $check_db ]]
    then
      echo "I could not find that element in the database."
  else
    NUMBER=$1
    FETCH_AND_PRINT $NUMBER
  fi
#Check if Symbol is provided as argument
elif [[ $1 =~ $check_letter ]]
then
  check_db=($($PSQL "select symbol from elements where symbol='$1'"))
  if [[ -z $check_db ]]
    then
      echo "I could not find that element in the database."
    else  
      SYM=$1
      NUMBER=($($PSQL "select atomic_number from elements where symbol='$SYM'"))
      FETCH_AND_PRINT $NUMBER
    fi  
#check if name of element is given as argument
elif [[ $1 =~ $check_word ]]
then
  check_db=($($PSQL "select name from elements where name='$1'"))
  if [[ -z $check_db ]]
    then
      echo "I could not find that element in the database."
    else
      NAME=$1
      NUMBER=($($PSQL "select atomic_number from elements where name='$NAME'"))
      FETCH_AND_PRINT $NUMBER
  fi
#Invalid argument is provided to script
else
  echo "I could not find that element in the database."
fi
