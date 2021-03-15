#!/bin/bash
set -e

#```
#Program: Jogo da Velha
#Author: Felipe Augusto de Souza Moura
#Created at: 2021/03/10
#```

declare -r O="O";
declare -r X="X";
vez=$(( $RANDOM % 2 ));
clear;

echo "";
echo "   |   |   ";
echo "---+---+---";
echo "   |   |   ";
echo "---+---+---";
echo "   |   |   ";
echo "";


if [[ $vez -eq 0 ]];
then
  read -p "Qual casa você quer o "X" " x;
else
  read -p "Qual casa quer o "O" " o;
fi
echo "";
