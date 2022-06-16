#!/bin/bash
#*******NUMBER GESSING GAME********
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
#regex to check no.
check_no='^[0-9]+$'
read USER
#code to play game and update database.
GAME_SCRIPT()
{
x=$(( $RANDOM%1000 ))
p=0
echo "Guess the secret number between 1 and 1000:"
while true
do
(( p++ ))
read NO
if [[ ! $NO =~ $check_no ]]
then
  echo "That is not an integer, guess again:"
elif [[ $NO -lt $x ]]
then
  echo "It's higher than that, guess again:"
elif [[ $NO -gt $x ]]
then
  echo "It's lower than that, guess again:"
else
  echo "You guessed it in $p tries. The secret number was $x. Nice job!"
  break
fi
done
insert_statement=$($PSQL "insert into users(name,score) values('$1',$p)")
}  

#code to check user in the database.
count=($($PSQL"select count(*) from users where name='$USER'"))
echo $count
if [[ $count -eq 0 ]]
then
  echo "Welcome, $USER! It looks like this is your first time here."
  GAME_SCRIPT "$USER"
else
  best=($($PSQL "select min(score) from users where name='$USER'"))
  echo "Welcome back, $USER! You have played $count games, and your best game took $best guesses."
  GAME_SCRIPT "$USER"
fi


