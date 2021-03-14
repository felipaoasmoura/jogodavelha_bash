#!/bin/bash
clear;
echo '';
echo '   |   |';
echo '---+---+---';
echo '   |   | ';
echo '---+---+---';
echo '   |   | ';
echo '';
read -p 'Qual casa você quer o "X" ' x;
echo '';
read -p 'Qual casa quer o "O" ' o;

clear;
O="O";
X="X";
echo '';
echo " $X |   |   ";
echo '---+---+---';
echo "   | $O |   ";
echo '---+---+---';
echo '   |   |   ';
echo '';
read -p 'Qual casa você quer o "X" ' x;
echo '';
read -p 'Qual casa quer o "O" ' o;

clear;
echo '';
echo " $X |   |   ";
echo '---+---+---';
echo "   | $O | $O ";
echo '---+---+---';
echo "   |   | $X ";
echo '';