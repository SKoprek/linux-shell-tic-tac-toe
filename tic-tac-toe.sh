#echo "hi"
function reset {
ZMIENA=""
TURA="1"

WYGRANA="0"
PLAYER=("X" "O")
TPLAYER=${PLAYER[0]}
PLANSZA=("?" "?" "?" "?" "?" "?" "?" "?" "?")
}
reset
function warunekWygrana {
for i in ${!PLAYER[@]}
do
if [[ ${PLANSZA[0]} = ${PLAYER[$i]} && ${PLANSZA[1]} = ${PLAYER[$i]} && ${PLANSZA[2]} = ${PLAYER[$i]} || 
 ${PLANSZA[3]} = ${PLAYER[$i]} && ${PLANSZA[4]} = ${PLAYER[$i]} && ${PLANSZA[5]} = ${PLAYER[$i]} || 
 ${PLANSZA[6]} = ${PLAYER[$i]} && ${PLANSZA[7]} = ${PLAYER[$i]} && ${PLANSZA[8]} = ${PLAYER[$i]} || 
 ${PLANSZA[0]} = ${PLAYER[$i]} && ${PLANSZA[3]} = ${PLAYER[$i]} && ${PLANSZA[6]} = ${PLAYER[$i]} || 
 ${PLANSZA[1]} = ${PLAYER[$i]} && ${PLANSZA[4]} = ${PLAYER[$i]} && ${PLANSZA[7]} = ${PLAYER[$i]} || 
 ${PLANSZA[2]} = ${PLAYER[$i]} && ${PLANSZA[5]} = ${PLAYER[$i]} && ${PLANSZA[8]} = ${PLAYER[$i]} || 
 ${PLANSZA[0]} = ${PLAYER[$i]} && ${PLANSZA[4]} = ${PLAYER[$i]} && ${PLANSZA[8]} = ${PLAYER[$i]} || 
 ${PLANSZA[2]} = ${PLAYER[$i]} && ${PLANSZA[4]} = ${PLAYER[$i]} && ${PLANSZA[6]} = ${PLAYER[$i]} 
]]
then
WYGRANA="1"
TPLAYER=${PLAYER[$i]}
else
 ZMIENA=$ZMIENA
fi
done

}
function wyborGracza {
ZMIENA=""
if [[ $TPLAYER = "" ||$TPLAYER = "O" ]]
then 
TPLAYER=${PLAYER[0]}
((TURA=$TURA+1))
else TPLAYER=${PLAYER[1]}
((TURA=$TURA+1))
fi

}


function wyswietl {
 clear
 echo "X-O"
	echo $ZMIENA
	echo "Tura: $TURA"
	echo "Aktualny gracz: $TPLAYER"
 echo " ${PLANSZA[0]} | ${PLANSZA[1]} | ${PLANSZA[2]}"
 echo "---|---|---"
 echo " ${PLANSZA[3]} | ${PLANSZA[4]} | ${PLANSZA[5]}"
 echo "---|---|---"
 echo " ${PLANSZA[6]} | ${PLANSZA[7]} | ${PLANSZA[8]}"
 echo "---------------"
 echo "Press q to exit"
 echo "Press r to restart"
}

#function sprawdzWygrana {
#
# for POLE in {0..8}
# do
# 	if [ ${PLANSZA[$POLE]} -eq $WART ]
# 	then 
# 		echo "TAK"
# 	else
# 		echo "NIE"
# 	fi
# done
#}


function insert {
count=$TURA
 if [[ $WYGRANA -eq "0" ]]
 then
	echo "Wybor pola, press 1-9:"
 fi
while :
 do
 read -n 1 k <&1
if [[ $k = q ]]
 then
 printf "\n Koniec skryptu \n"
 exit
#keys
elif [[ $k = r ]]
 then
	reset
 break
#1
elif [[ $k = 1 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[0]} = "?" ]]
 	then
 	PLANSZA[0]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
#2
elif [[ $k = 2 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[1]} = "?" ]]
 	then
 	PLANSZA[1]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
 #3
elif [[ $k = 3 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[2]} = "?" ]]
 	then
 	PLANSZA[2]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
  #4
elif [[ $k = 4 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[3]} = "?" ]]
 	then
 	PLANSZA[3]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
  #3
elif [[ $k = 5 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[4]} = "?" ]]
 	then
 	PLANSZA[4]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
  #3
elif [[ $k = 6 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[5]} = "?" ]]
 	then
 	PLANSZA[5]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
  #3
elif [[ $k = 7 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[6]} = "?" ]]
 	then
 	PLANSZA[6]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
  #3
elif [[ $k = 8 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[7]} = "?" ]]
 	then
 	PLANSZA[7]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
  #3
elif [[ $k = 9 && $WYGRANA -eq "0" ]]
 then
 	if [[ ${PLANSZA[8]} = "?" ]]
 	then
 	PLANSZA[8]=$TPLAYER
 	wyborGracza
 	else
 	ZMIENA="***|Pole zajete|***"
 	fi
 break
else
 ZMIENA=$ZMIENA
 break
fi
done
}


while :
do
	while [ $WYGRANA -eq "0" ]
	do

 	wyswietl
 	warunekWygrana
 	 if [[ $WYGRANA -eq "0" ]]
 	 then
		insert
	 fi
	done
 if [[ $WYGRANA -eq "0" ]]
 then
 echo "Powiedz jak sie tu znalazlem"
 else
 wyswietl
  echo "*********WYGRAL GRACZ $TPLAYER********"
 insert

 fi
 done
