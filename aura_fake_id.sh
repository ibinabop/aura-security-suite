#!/bin/bash
echo "========================================="
echo "       FAKE IDENTITY GENERATOR"
echo "========================================="
NAMES=("James" "Michael" "David" "John" "Robert")
LASTNAMES=("Smith" "Johnson" "Williams" "Brown")
CITIES=("New York" "London" "Toronto" "Sydney")
NAME="${NAMES[$RANDOM % ${#NAMES[@]}]} ${LASTNAMES[$RANDOM % ${#LASTNAMES[@]}]}"
CITY="${CITIES[$RANDOM % ${#CITIES[@]}]}"
echo "Name: $NAME"
echo "Address: $CITY"
echo "Email: ${NAME// /,}@protonmail.com"
