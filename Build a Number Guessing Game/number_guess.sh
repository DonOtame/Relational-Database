#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t -c"

echo Enter your username:

read USERNAME

# Verifica si el usuario ya existe en la base de datos.
# Si no existe, lo inserta. Si existe, muestra estadísticas de juegos anteriores.

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

if [[ -z $USER_ID ]]; then
  # Si el usuario no existe, lo insertamos en la base de datos
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

  # Recupera el USER_ID después de la inserción
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  
  echo -e "Welcome, $USERNAME! It looks like this is your first time here."
else
  # Si el usuario ya existe, obtenemos las estadísticas de juegos previos
  USER_GAMES=$($PSQL "SELECT COUNT(*), MIN(number_of_guesses) FROM games WHERE user_id = '$USER_ID'")

  # Mostrar las estadísticas del usuario
  echo "$USER_GAMES" | while read GAMES_PLAYED BAR BEST_GAME; do
    echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi

# Genera un número secreto entre 1 y 1000 y permite al usuario adivinarlo.
# El bucle continúa hasta que el usuario adivina correctamente.
SECRET_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

# Asumimos que $USER_ID ya está definido
if [[ -z "$USER_ID" ]]; then
  echo "Error: USER_ID is not set."
  exit 1
fi

while true; do
  read NUMBER

  # Verificar si el valor ingresado es un entero positivo
  if ! [[ $NUMBER =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Incrementa el contador de intentos
  ((NUMBER_OF_GUESSES++))

  if [[ $NUMBER -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  elif [[ $NUMBER -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  else
    echo -e "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

    # Ejecuta la consulta para insertar los resultados del juego en la base de datos
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES('$USER_ID', '$NUMBER_OF_GUESSES');")

    break
  fi
done
