#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ My Salon ~~~~~\n"

echo -e "\nWelcome to My Salon. How may I help you?\n"

MAIN_MENU() {
 if [[ $1 ]]
  then
    echo -e "\n$1" 
  fi

# get services
MY_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

# display available services 
echo "$MY_SERVICES" | while read SERVICE_ID BAR NAME
do
  echo "$SERVICE_ID) $NAME"
done

# ask for service requested
read SERVICE_ID_SELECTED

#if input is not a number
#if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
#then
#send to main menu
  #MAIN_MENU "I could not find that service. What would you like today?"
#fi

SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
if [[ -z $SERVICE ]]
then
# service ID does not exist
  MAIN_MENU "I could not find that service. What would you like today?"
  exit 0
else
  
          #get customer info
          echo -e "\nWhat's your phone number?"
          read CUSTOMER_PHONE
          CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone = '$CUSTOMER_PHONE'")
          #if customer doesn't exist
          if [[ -z $CUSTOMER_NAME  ]]
          then
            #get new customer name
            echo -e "\nWhat's your name?"
            read CUSTOMER_NAME
            #insert new customer
            INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
          fi
          # get customer_id
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
            
          #we can ask for an appointment time and then insert an appointment now.
          echo -e "\nWhat time would you like your cut,$CUSTOMER_NAME?"
          read SERVICE_TIME
          INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')") 
          if [ $? -eq 0 ]
          then
            echo "I have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
          fi


fi  



}



MAIN_MENU
