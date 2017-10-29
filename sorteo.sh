clear
tput cup 1 1 
echo "Usuario: $usuario"
apuestas=`cat jugadas | wc -l`
apuestasr=`cat jugadasrevancha | wc -l`
jugadas=$((apuestas + apuestasr))
tput cup 1 40 
echo "Apuestas realizadas: $jugadas"
tput cup 3 1 
echo "Presione 5 para realizar el sorteo"
tput cup 4 1
echo "Presione 0 para salir"
opsorteo=1
while [ "$opsorteo" -ne "5" ] && [ "$opsorteo" -ne "0" ] 
do
read -s -n 1 opsorteo

case $opsorteo in
5)
	b1=$((1+RANDOM%48))
	b2=$((1+RANDOM%48))
	b3=$((1+RANDOM%48))
	b4=$((1+RANDOM%48))
	b5=$((1+RANDOM%48))
	be=$((1+RANDOM%48))
	while [ "$b1" -eq "$b2" ] || [ "$b1" -eq "$b3" ] || [ "$b1" -eq "$b4" ] || [ "$b1" -eq "$b5" ] || [ "$b1" -eq "$be" ] 
	do
	b1=$((1+RANDOM%48))
	done

        while [ "$b2" -eq "$b1" ] || [ "$b2" -eq "$b3" ] || [ "$b2" -eq "$b4" ] || [ "$b2" -eq "$b5" ] || [ "$b2" -eq "$be" ]
        do
        b2=$((1+RANDOM%48))
        done
	
        while [ "$b3" -eq "$b1" ] || [ "$b3" -eq "$b2" ] || [ "$b3" -eq "$b4" ] || [ "$b3" -eq "$b5" ] || [ "$b3" -eq "$be" ]
        do
        b3=$((1+RANDOM%48))
        done

        while [ "$b4" -eq "$b1" ] || [ "$b4" -eq "$b2" ] || [ "$b4" -eq "$b3" ] || [ "$b4" -eq "$b5" ] || [ "$b4" -eq "$be" ]
        do
        b4=$((1+RANDOM%48))
        done

        while [ "$b5" -eq "$b1" ] || [ "$b5" -eq "$b2" ] || [ "$b5" -eq "$b3" ] || [ "$b5" -eq "$b4" ] || [ "$b5" -eq "$be" ]
        do
        b5=$((1+RANDOM%48))
        done

        while [ "$be" -eq "$b1" ] || [ "$be" -eq "$b2" ] || [ "$be" -eq "$b3" ] || [ "$be" -eq "$b4" ] || [ "$be" -eq "$b5" ]
        do
        be=$((1+RANDOM%48))
        done

        br1=$((1+RANDOM%48))
        br2=$((1+RANDOM%48))
        br3=$((1+RANDOM%48))
        br4=$((1+RANDOM%48))
        br5=$((1+RANDOM%48))

        while [ "$br1" -eq "$br2" ] || [ "$br1" -eq "$br3" ] || [ "$br1" -eq "$br4" ] || [ "$br1" -eq "$br5" ]
        do
        br1=$((1+RANDOM%48))
        done

        while [ "$br2" -eq "$br1" ] || [ "$br2" -eq "$br3" ] || [ "$br2" -eq "$br4" ] || [ "$br2" -eq "$br5" ]
        do
        br2=$((1+RANDOM%48))
        done

        while [ "$br3" -eq "$br1" ] || [ "$br3" -eq "$br2" ] || [ "$br3" -eq "$br4" ] || [ "$br3" -eq "$br5" ]
        do
        br3=$((1+RANDOM%48))
        done

        while [ "$br4" -eq "$br1" ] || [ "$br4" -eq "$br2" ] || [ "$br4" -eq "$br3" ] || [ "$br4" -eq "$br5" ]
        do
        br4=$((1+RANDOM%48))
        done

        while [ "$br5" -eq "$br1" ] || [ "$br5" -eq "$br2" ] || [ "$br5" -eq "$br3" ] || [ "$br5" -eq "$br4" ]
        do
        br5=$((1+RANDOM%48))
        done

	
	echo "BOLILLERO 1: 5 DE ORO"
	echo "$b1":"$b2":"$b3":"$b4":"$b5"-"$be"
	echo "BOLILLERO 2: 5 DE ORO REVANCHA"
	echo "$br1":"$br2":"$br3":"$br4":"$br5"

############################################################################# 	

grep ":$b1":"$b2":"$b3":"$b4":"$b5:" jugadas > ganadores5deoro
cantganadores=`cat ganadores5deoro | wc -l`
	
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$b4:" | grep ":$be:" >> ganadoresplata
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$b5:" | grep ":$be:" >> ganadoresplata
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadoresplata
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadoresplata
grep ":$b2:" jugadas | grep ":$b3:" | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadoresplata
cantgplata=`cat ganadoresplata | wc -l`
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$b4:" >> ganadores4de5
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$b5:" >> ganadores4de5
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b4:" | grep ":$b5:" >> ganadores4de5
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$b4:" | grep ":$b5:" >> ganadores4de5
grep ":$b2:" jugadas | grep ":$b3:" | grep ":$b4:" | grep ":$b5:" >> ganadores4de5
cantg4de5=`cat ganadores4de5 | wc -l`
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$be:" >> ganadores3de5E
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b1:" jugadas | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b4:" | grep ":$be:" >> ganadores3de5E
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b2:" jugadas | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
cantg3de5E=`cat ganadores3de5E | wc -l`
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" >> ganadores3de5
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b5:" >> ganadores3de5
grep ":$b1:" jugadas | grep ":$b4:" | grep ":$b5:" >> ganadores3de5
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$b5:" >> ganadores3de5
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b4:" >> ganadores3de5
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$b5:" >> ganadores3de5
grep ":$b2:" jugadas | grep ":$b4:" | grep ":$b5:" >> ganadores3de5
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$b5:" >> ganadores3de5
cantg3de5=`cat ganadores3de5 | wc -l`
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$be:" >> ganadores2de5E
grep ":$b2:" jugadas | grep ":$b3:" | grep ":$be:" >> ganadores2de5E
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$be:" >> ganadores2de5E
grep ":$b4:" jugadas | grep ":$b5:" | grep ":$be:" >> ganadores2de5E
grep ":$b1:" jugadas | grep ":$b5:" | grep ":$be:" >> ganadores2de5E
grep ":$b3:" jugadas | grep ":$b5:" | grep ":$be:" >> ganadores2de5E
grep ":$b1:" jugadas | grep ":$b4:" | grep ":$be:" >> ganadores2de5E
grep ":$b2:" jugadas | grep ":$b5:" | grep ":$be:" >> ganadores2de5E
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$be:" >> ganadores2de5E
grep ":$b2:" jugadas | grep ":$b4:" | grep ":$be:" >> ganadores2de5E
cantg2de5E=`cat ganadores2de5E | wc -l`
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$be:" >> ganadores2de5
grep ":$b2:" jugadas | grep ":$b3:" | grep ":$be:" >> ganadores2de5
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$be:" >> ganadores2de5
grep ":$b4:" jugadas | grep ":$b5:" | grep ":$be:" >> ganadores2de5
grep ":$b1:" jugadas | grep ":$b5:" | grep ":$be:" >> ganadores2de5
grep ":$b3:" jugadas | grep ":$b5:" | grep ":$be:" >> ganadores2de5
grep ":$b1:" jugadas | grep ":$b4:" | grep ":$be:" >> ganadores2de5
grep ":$b2:" jugadas | grep ":$b5:" | grep ":$be:" >> ganadores2de5
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$be:" >> ganadores2de5
grep ":$b2:" jugadas | grep ":$b4:" | grep ":$be:" >> ganadores2de5
cantg2de5=`cat ganadores2de5 | wc -l`
grep ":$br1:$br2:$br3:$br4:$br5:" jugadasrevancha > ganadoresrevancha
cantgrevancha=`cat ganadoresrevancha | wc -l`


if [ $cantganadores -gt 0 ]
then		
	i=1

	for (( c=0; c<$cantganadores; c++ ))
	do
		g5deoro[c]=`head -n$i ganadores5deoro | tail -n1`
		i=$((i+1))
	done
	
else 
	
	g5deoro[0]=1	  
fi
echo "g5deoro= ${g5deoro[@]} "
if [ $cantgplata -gt 0 ]
then
        i=1

        for (( c=0; c<$cantgplata; c++ ))
        do
                gplata[c]=`head -n$i ganadoresplata | tail -n1`
                i=$((i+1))
        done

else

        gplata[0]=1
fi
echo "gplata= ${gplata[@]} "
if [ $cantg4de5 -gt 0 ]
then
        i=1

        for (( c=0; c<$cantg4de5; c++ ))
        do
                g4de5[c]=`head -n$i ganadores4de5 | tail -n1`
                i=$((i+1))
        done

else

        g4de5[0]=1
fi
echo "g4de5= ${g4de5[@]} "
if [ $cantg3de5E -gt 0 ]
then
        i=1

        for (( c=0; c<$cantg3de5E; c++ ))
        do
                g3de5E[c]=`head -n$i ganadores3de5E | tail -n1`
                i=$((i+1))
        done

else

        g3de5E[0]=1
fi
echo "g3de5E= ${g3de5E[@]} "
if [ $cantg3de5 -gt 0 ]
then
        i=1

        for (( c=0; c<$cantg3de5; c++ ))
        do
                g3de5[c]=`head -n$i ganadores3de5 | tail -n1`
                i=$((i+1))
        done

else

        g3de5[0]=1
fi
echo "g3de5= ${g3de5[@]} "
if [ $cantg2de5E -gt 0 ]
then
        i=1

        for (( c=0; c<$cantg2de5E; c++ ))
        do
                g2de5E[c]=`head -n$i ganadores2de5E | tail -n1`
                i=$((i+1))
        done

else

        g2de5E[0]=1
fi
echo "g2de5E= ${g2de5E[@]} "
if [ $cantg2de5 -gt 0 ]
then
        i=1

        for (( c=0; c<$cantg2de5; c++ ))
        do
                g2de5[c]=`head -n$i ganadores2de5 | tail -n1`
                i=$((i+1))
        done

else

        g2de5[0]=1
fi
echo "g2de5= ${g2de5[@]} "
if [ $cantgrevancha -gt 0 ]
then
        i=1

        for (( c=0; c<$cantgrevancha; c++ ))
        do
                grevancha[c]=`head -n$i ganadoresrevancha | tail -n1`
                i=$((i+1))
        done

else

        grevancha[0]=1
fi
echo "grevancha= ${grevancha[@]} "

       # saldo=`grep $ganador usuarios | cut -d":" -f7

        #nuevosaldo=$((saldo + oro))
        #lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`

        #echo `grep -v $ganador usuarios > tempusuario`
        #rm usuarios
        #mv tempusuario usuarios
        #echo $lineaactual":"$nuevosaldo >> usuarios


;;

0) sh menu.sh ;; 
	
esac
done 
