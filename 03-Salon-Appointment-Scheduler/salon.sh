
#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~  MY SALON ~~~~~\n"

SERVICE_MENU(){
  # if service_menu() is called with an argument
  if [[ $1 ]]
  then
    # print that argument
    echo -e "\n$1"
  fi

  # if service_menu() is called without an argument
  if [[ -z $1 ]]
  then
    echo Welcome to My Salon, how can I help you?
  fi

  # select service_id and service_name from services table
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  # print service_id and service_name line by line
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"

  done
  # prompt user to enter service_id
  read SERVICE_ID_SELECTED

  # check if the service_id the user entered is in the services table
  CHECK_SELECTION=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED;")

  
  if [[ -z $CHECK_SELECTION ]]
  # if the service_id the user entered does not exist in the services table
  then
    # call service_menu() again with an argument (will show the services list again)
    SERVICE_MENU "I could not find that service. What would you like today?"
  else
    # if the user chose a valid service_id
    # get customer phone number
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    # check if the phone number the user entered exists in the customers table
    CHECK_PHONE_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE';")
    
    if [[ -z $CHECK_PHONE_NUMBER ]]
    then
      # if the user is not a customer from the customers table
      # get customer name
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # insert the phone number and name of that new customer into customers table
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")     
         
    fi

    # get info about appointment time
    SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
    echo -e "\nWhat time would you like your $(echo $SERVICE_SELECTED | sed -E 's/^ *| *$//g'), $(echo $GET_CUSTOMER_NAME | sed -E 's/^ *| *$//g')?"

    read SERVICE_TIME

    # insert appointment info into appointments table
    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($GET_CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")

    echo -e "\nI have put you down for a $(echo $SERVICE_SELECTED | sed -E 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -E 's/^ *| *$//g'), $(echo $GET_CUSTOMER_NAME | sed -E 's/^ *| *$//g')."

    


    

 


  fi

 

}


SERVICE_MENU
