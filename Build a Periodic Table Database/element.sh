#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -A -t -F '|' -c"

# Verifica si se proporcionó un argumento
if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
  exit
fi

# Determina si el argumento es un número
if [[ $1 =~ ^[0-9]+$ ]]; then
  QUERY="SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius
         FROM elements
         LEFT JOIN properties USING(atomic_number)
         LEFT JOIN types USING(type_id)
         WHERE atomic_number = $1;"
else
  QUERY="SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius
         FROM elements
         LEFT JOIN properties USING(atomic_number)
         LEFT JOIN types USING(type_id)
         WHERE symbol ILIKE '$1' OR name ILIKE '$1';"
fi

# Ejecuta la consulta
ELEMENT=$($PSQL "$QUERY")

# Si no se encuentra
if [[ -z $ELEMENT ]]; then
  echo "I could not find that element in the database."
  exit
fi

# Elimina los apóstrofos y procesa el resultado sin espacios extra
ELEMENT=$(echo "$ELEMENT" | sed "s/'//g")

IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<<"$ELEMENT"

echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
