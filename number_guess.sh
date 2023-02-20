#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GREETING() {
  echo "Enter your username:"
  read USERNAME
  QUERY_USER_ID=$($PSQL "SELECT user_id FROM number_guess WHERE username='$USERNAME'")
  # check if username does not exist
  if [[ -z $QUERY_USER_ID ]]
  then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    NEW_USERNAME=$($PSQL "INSERT INTO number_guess(username) VALUES ('$USERNAME')")
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE username='$USERNAME'")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
  GUESSING_GAME
}

GUESSING_GAME() {
  # initialize secret number and number of guesses
  SECRET_NUMBER=$((1 + $RANDOM % 1000))
  NUMBER_OF_GUESSES=0
  WIN=1
  # check if guess is a number
  echo "Guess the secret number between 1 and 1000:"
  while true
  do
    read GUESS
    if [[ $GUESS =~ ^[0-9]+$ ]]
    then
      NUMBER_OF_GUESSES=$(( $NUMBER_OF_GUESSES + 1 ))
      if [[ $GUESS -gt $SECRET_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $GUESS -lt $SECRET_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      elif [[ $GUESS -eq $SECRET_NUMBER ]]
      then
        # record game result
        USER_ID=$($PSQL "SELECT user_id FROM number_guess WHERE username='$USERNAME'")
        NEW_GAME=$($PSQL "INSERT INTO games(user_id, username, guesses) VALUES($USER_ID, '$USERNAME', $NUMBER_OF_GUESSES)")
        #update number of games
        GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
        BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")
        UPDATE_GAMES_PLAYED=$($PSQL "UPDATE number_guess SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID")
        UPDATE_BEST_GAME=$($PSQL "UPDATE number_guess SET best_game=$BEST_GAME WHERE user_id=$USER_ID")
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
        break
      fi
    else
      echo "That is not an integer, guess again:"
    fi
  done
}

GREETING
