#!/bin/bash
#set -x
#set -o errexit   # abort on nonzero exitstatus
#set -o nounset   # abort on unbound variable
#set -o pipefail  # don't hide errors within pipes
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
vencedor='';
contador=0;
vermelho='\033[31m';
padrao='\033[0m';
azul='\033[34m';
campeao='\033[5;33m';

function verifica_vencedor() {
  contador=$(( $contador + 1 ));
  for linha in a b c;
  do
: '
    ## Felipe, faça uma repetição de 1 até 3
    ## Vamos apreder sobre array (vetor)
    ## Para cada volta
    ##  vamos inserir no array "casa",
    ##  na posição i,
    ##  O valor do conteúdo da variável "linha",
    ##  concatenado com o conteúdo de i;
    ## Ex:
    ## Para cada "coluna" de 1 até 3 incrementando em 1
    ## faça:
    ##   casa[i] <-- linha + coluna
    ## fim para
    Troque as referencias
      "casa1" por "casa[1]"
      "casa2" por "casa[2]"
      "casa3" por "casa[3]"
'
    casa1=${linha}1;
    casa2=${linha}2;
    casa3=${linha}3;
    ###########
    if [[ ${!casa1} != " " && ${!casa1} == ${!casa2} && ${!casa3} == ${!casa1} ]];
    then
      vencedor="Parabéns, jogador ${!casa1}";
      pisca="$(echo $campeao${!casa1}$padrao)"
      for ((i=1;i<=3;i++));
      do
        casa=${linha}${i};
        eval "$casa='${pisca}'";
      done
    fi
  done

:'
  Felipe, faça um loop de 1 até 3 incrementando 1;
  Para coluna de 1 até 3; faça
     Para cada linha em "a" "b" "c"
     Faça
        casa[linha] <-- linha + coluna
     Fim para
     Atribua o valor
     Troque as referenicias
        a1 por casa[1]
        b1 por casa[2]
        c1 por casa[3]
     Teste se há vencedores
     Repita o for já efecutado no
        no teste de vencedor horizontal
'
  if [[ $a1 != " " && $a1 == $b1 && $c1 == $a1 ]];
  then
    vencedor="Parabéns, jogador $a1";
    a1=$campeao$a1$padrao
    b1=$campeao$b1$padrao
    c1=$campeao$c1$padrao
  fi
  if [[ $a2 != " " && $a2 == $b2 && $c2 == $a2 ]];
  then
    vencedor="Parabéns, jogador $a2";
    a2=$campeao$a2$padrao
    b2=$campeao$b2$padrao
    c2=$campeao$c2$padrao
  fi
  if [[ $a3 != " " && $a3 == $b3 && $c3 == $a3 ]];
  then
    vencedor="Parabéns, jogador $a3";
    a3=$campeao$a3$padrao
    b3=$campeao$b3$padrao
    c3=$campeao$c3$padrao
  fi


  if [[ $a1 != " " && $a1 == $b2 && $c3 == $a1 ]];
  then
    vencedor="Parabéns, jogador $a1";
    a1=$campeao$a1$padrao
    b2=$campeao$b2$padrao
    c3=$campeao$c3$padrao
  fi
  if [[ $a3 != " " && $c1 == $b2 && $c1 == $a3 ]];
  then
    vencedor="Parabéns, jogador $a3";
    a3=$campeao$a3$padrao
    b2=$campeao$b2$padrao
    c1=$campeao$c1$padrao
  fi
}

function desenha_tabulero() {
  clear;
  echo "     1   2   3";
  echo "";
  echo -e " a   $a1 | $a2 | $a3 ";
  echo "    ---+---+---";
  echo -e " b   $b1 | $b2 | $b3 ";
  echo "    ---+---+---";
  echo -e " c   $c1 | $c2 | $c3 ";
  echo "";
}
desenha_tabulero;
while [[ $contador -lt 9 ]];
do
   if [[ $vez -eq 0 ]];
   then
      livre="s";
      while [[ -n $livre ]];
      do
         read -p "Qual casa você quer o 'X' " x;
         x=${x,,};
         livre="$(echo ${!x} | tr -d '\ ')";
         ## Felipe, inclua o teste abaixo
         ## se $x não pertence a  ( "a1" "b1" "c1" "a2" ... )
         ## então
         ##    exiba "Casa inválida!!"
         ##    espere 1 segundo
         ##    continue na proxima volta
         ## fim se
      done
      eval "$x=$X";
      vez=1;
   else
      livre="s";
      while [[ -n $livre ]];
      do
         read -p "Qual casa quer o 'O' " o;
         o=${o,,};
         livre="$(echo ${!o} | tr -d '\ ')";
      done
      eval "$o=$O";
      vez=0;
   fi
   echo "";
   verifica_vencedor;
   desenha_tabulero;
   if [[ -n $vencedor ]];
   then
      echo $vencedor;
      exit;
   fi
done
echo 'A velha ganhou';
