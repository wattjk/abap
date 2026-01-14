#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

#create team records for winners
do

  if [[ $WINNER != winner  ]]
  then
  # get winner_id 
  WINNER_ID=$($PSQL "SELECT team_id from teams where name = '$WINNER'")
 
  # if not found 
    if [[ -z $WINNER_ID ]] #winner team does not exist yet
    then
      # insert major
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $WINNER"
      fi
      # get new winner_id 
      WINNER_ID=$($PSQL "SELECT team_id from teams where name = '$WINNER'")
    fi


#create team records for opponents if they don't already exist

  # get OPPONENT_id 
  OPPONENT_ID=$($PSQL "SELECT team_id from teams where name = '$OPPONENT'")
 
  # if not found 
    if [[ -z $OPPONENT_ID ]] #OPPONENT team does not exist yet
    then
      # insert OPPONENT
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $OPPONENT"
      fi
      # get new OPPONENT_id 
      OPPONENT_ID=$($PSQL "SELECT team_id from teams where name = '$OPPONENT'")
    fi


    # insert into games
    INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games (round, year, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$ROUND', $YEAR, $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
    then
        echo "Inserted into games, $ROUND : $YEAR : $WINNER"
    fi
  fi  


done

echo "Done..."

