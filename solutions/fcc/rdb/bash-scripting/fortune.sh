#!/bin/bash
# Program to tell a persons fortune
echo -e "\n~~ Fortune Teller ~~\n"

RESPONSES=("Yes" "No" "Maybe" "Outlook good" "Don't count on it" "Ask again later")
N=$(( RANDOM % 6 ))

GET_FORTUNE() {
  
  if [[ ! $1 ]]  $1 is the first argument passed (if there is one)
  then
    echo Ask a yes or no question:
  else
    echo Try again. Make sure it ends with a question mark:  
  fi
  read QUESTION
}

GET_FORTUNE  #called without argument exit status will be 0 to ask initial question (???)

until [[ $QUESTION =~ \?$ ]]
do
  GET_FORTUNE again  #called with arguments
done

echo -e "\n"${RESPONSES[$N]}
