#!/bin/bash
set -e

'''
Program: Jogo da Velha
Author: Felipe Augusto de Souza Moura
Created at: 2021/03/10
'''

declare -r O="O";
declare -r X="X";

clear;

echo "";
echo "   |   |   ";
echo "---+---+---";
echo "   |   |   ";
echo "---+---+---";
echo "   |   |   ";
echo "";

read -p "Qual casa você quer o "X" " x;
echo "";
read -p "Qual casa quer o "O" " o;
