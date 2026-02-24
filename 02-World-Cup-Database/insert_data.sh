
#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # skip the top line of game.csv (title line)
  if [[ $YEAR != 'year' ]]
  then
    # insert winner team name into team table
    # to check if the winner team name already exists in the team table
    IS_WINNER_EXIST=$($PSQL "SELECT EXISTS(SELECT 1 FROM teams WHERE name='$WINNER');")
    # if the winner team name does not exist
    if [[ $IS_WINNER_EXIST == "f" ]]
    then
      INSERT_WINNER_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")          
    fi

    # insert opponent team name into team table
    # to check if the opponent team name already exists in the team table
    IS_OPPONENT_EXIST=$($PSQL "SELECT EXISTS(SELECT 1 FROM teams WHERE name='$OPPONENT');")
    # if the opponent team name does not exist
    if [[ $IS_OPPONENT_EXIST == "f" ]]
    then
      INSERT_OPPONENT_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")           
    fi

    # insert data into games table 
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
    INSERT_GAMES=$($PSQL "INSERT INTO games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS);")





  fi

done
