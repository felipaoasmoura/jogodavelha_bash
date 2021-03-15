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
a1=' ';
a2=' ';
a3=' ';
b1=' ';
b2=' ';
b3=' ';
c1=' ';
c2=' ';
c3=' ';
contador=0;

while [[ $contador -lt 9 ]];
do
  contador=$(( $contador + 1 ));
  clear;


  echo "";
  echo " $a1 | $a2 | $a3 ";
  echo "---+---+---";
  echo " $b1 | $b2 | $b3 ";
  echo "---+---+---";
  echo " $c1 | $c2 | $c3 ";
  echo "";

  if [[ $a1 != " " && $a1 == $a2 && $a3 == $a1 ]];
  then
    echo "Parabéns, jogador $a1";
    exit;
  fi
  if [[ $b1 != " " && $b1 == $b2 && $b3 == $b1 ]];
  then
    echo "Parabéns, jogador $b1";
    exit;
  fi
  if [[ $c1 != " " && $c1 == $c2 && $c3 == $c1 ]];
  then
    echo "Parabéns, jogador $c1";
    exit;
  fi

  if [[ $a1 != " " && $a1 == $b1 && $c1 == $a1 ]];
  then
    echo "Parabéns, jogador $a1";
    exit;
  fi
  if [[ $a2 != " " && $a2 == $b2 && $c2 == $a2 ]];
  then
    echo "Parabéns, jogador $a2";
    exit;
  fi
  if [[ $a3 != " " && $a3 == $b3 && $c3 == $a3 ]];
  then
    echo "Parabéns, jogador $a3";
    exit;
  fi

    if [[ $a1 != " " && $a1 == $b2 && $c3 == $a1 ]];
    then
      echo "Parabéns, jogador $a1";
      exit;
    fi
    if [[ $a3 != " " && $c1 == $b2 && $c1 == $a3 ]];
    then
      echo "Parabéns, jogador $a3";
      exit;
    fi

  if [[ $vez -eq 0 ]];
  then
    read -p "Qual casa você quer o 'X' " x;
    eval "$x=$X";
    vez=1;
  else
    read -p "Qual casa quer o 'O' " o;
    o=${o,,};
    eval "$o=$O";
    vez=0;
  fi
  echo "";
done
echo 'A velha ganhou'
