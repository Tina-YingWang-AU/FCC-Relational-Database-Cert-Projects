
#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
# check if the argument is empty
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  # check if the argument is a number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # if argument is a number, query against atomic_number
    QUERY_RESULT=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$1;")
  else
    # if argument is not a number, query agaist symbol or name
    QUERY_RESULT=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol='$1' OR name='$1'; ")
  fi 
  # If no results are found
  if [[ -z $QUERY_RESULT ]]  
  then
    echo "I could not find that element in the database."
  else
    # Using IFS="|" with read to extract all variables
    echo "$QUERY_RESULT" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING BOILING
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done

  fi

fi
