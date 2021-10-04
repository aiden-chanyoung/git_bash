#!/bin/bash
# Ask the user for their name
echo Hello, who am I talking to?
read varname
echo It\'s nice to meet you $varname

read -p 'Username: ' uservar
read -sp 'Password: ' passvar
echo
echo Thankyou $uservar we now have your login details

echo What cars do you like?
read car1 car2 car3
echo Your first car was: $car1
echo Your second car was: $car2
echo Your third car was: $car3
