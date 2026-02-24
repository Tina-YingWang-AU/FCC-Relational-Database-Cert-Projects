
#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"

read USERNAME

CHECK_USERNAME=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")
# check if the username exists in 'users' table
if [[ -z $CHECK_USERNAME ]]
# if the username does not exist in 'users' table
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # insert the username into 'users' table
  INSERT_USERNAME=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  echo "Welcome back, $(echo $USERNAME | sed -E 's/^ *| *$//g')! You have played $(echo $GAMES_PLAYED | sed -E 's/^ *| *$//g') games, and your best game took $(echo $BEST_GAME | sed -E 's/^ *| *$//g') guesses."
fi

echo "Guess the secret number between 1 and 1000:"

read GUESS_NUMBER
# check if the input is an integer
if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
then
  # ask the user to input something until it's an integer
  until [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS_NUMBER
  done
fi

TRIES=1 
while [[ $GUESS_NUMBER -ne $SECRET_NUMBER ]]
do
  if [[ $GUESS_NUMBER -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    read GUESS_NUMBER
    (( TRIES++ ))
  else
    echo "It's higher than that, guess again:"
    read GUESS_NUMBER
    (( TRIES++ ))
  fi

done

echo "You guessed it in $TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"

# update the number of games played by 1
UPDATE_GAMES=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username = '$USERNAME'")

# check if the number of tries of this game is fewer than best game in the 'users' table
# if there is no best game before or if the number of tries of this game is fewer than best game
if [[ -z $BEST_GAME || $TRIES -lt $BEST_GAME ]]
then
  UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $TRIES WHERE username='$USERNAME'")
fi
