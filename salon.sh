#!/bin/bash
echo -e "\n **************** WELCOME TO SALON ****************** \n"
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
CREATE_APPOINTMENT()
{
Cust_id=$($PSQL "select customer_id from customers where name='$2'")
Make_appointment=$($PSQL "insert into appointments(service_id,customer_id,time) values($1,$Cust_id,'$3')")
if [[ -z $Make_appointment ]]
then
  echo -e "\nInsert not successful."
else
  echo -e "\nI have put you down for a$4 at $3, $2."
fi

} 
GET_INPUT()
{
read SERVICE_ID_SELECTED
READED_SERVICE=$($PSQL "select name from services where service_id='$SERVICE_ID_SELECTED'")
echo $READED_SERVICE
if [[ -z $READED_SERVICE ]]
  then 
    echo "I could not find that service. What would you like today?"
    MENU
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    Phone_exists=$($PSQL "select phone from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $Phone_exists ]]
    then 
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      ADD_CUST=$($PSQL "insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      echo -e "\nWhat time would you like your $READED_SERVICE, $CUSTOMER_NAME?"
      read SERVICE_TIME
      CREATE_APPOINTMENT $SERVICE_ID_SELECTED $CUSTOMER_NAME $SERVICE_TIME "$READED_SERVICE"
    else
      CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
      echo -e "\nWhat time would you like your $READED_SERVICE, $CUSTOMER_NAME?"
      read SERVICE_TIME
      CREATE_APPOINTMENT $SERVICE_ID_SELECTED $CUSTOMER_NAME $SERVICE_TIME "$READED_SERVICE"
    fi
fi
}

MENU()
{
COUNT=$($PSQL "select count(*) from services")
i=1
while [[ $i -le $COUNT ]]
do
  SERVICE=$($PSQL "select name from services where service_id=$i")
  echo "$i) $SERVICE"
  i=$(( i+1 ))
done
GET_INPUT
}
MENU


