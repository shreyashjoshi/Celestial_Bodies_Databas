#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#Truncate tables
re=$($PSQL "TRUNCATE table teams,games")
echo $re

#code to add teams
cat games.csv | while IFS=',' read YEAR ROUND WINNER APPONENT WINNER_GOAL APPONANT_GOAL
do
if [[ $WINNER != 'winner' ]]
then
#check if the winner team already exists in database
EXIST_WINNER=$($PSQL "SELECT team_id from teams where name='$WINNER'")
#if doesnt exist add winner team
if [[ -z $EXIST_WINNER ]]
then
INSERT_VALUES=$($PSQL "insert into teams(name) values('$WINNER')")
echo -e "\n Insert values into the teams table,$INSERT_VALUES"
EXIST_WINNER=$($PSQL "SELECT team_id from teams where name='$WINNER'")
fi
# check if opponent exist in database
EXIST_OPPONENT=$($PSQL "SELECT team_id from teams where name='$APPONENT'")
#if not add in the database
if [[ -z $EXIST_OPPONENT ]]
then
INSERT_VALUES=$($PSQL "insert into teams(name) values('$APPONENT')")
echo -e "\n Insert values into the teams table,$INSERT_VALUES"
EXIST_OPPONENT=$($PSQL "SELECT team_id from teams where name='$APPONENT'")
fi
fi
#code to add games
INSERT_GAMES=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$EXIST_WINNER,$EXIST_OPPONENT,$WINNER_GOAL,$APPONANT_GOAL)")
echo -e "\n Insert values into the teams table,$INSERT_GAMES"
done

