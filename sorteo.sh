clear
sh cabecera.sh
echo "Sorteo"
if [ "$dia" == "Lunes" ] || [ "$dia" == "Miércoles" ]
then

cat jugadas > jugadasanterior
cat jugadasrevancha > jugadasranterior
rm ultimosorteo
apuestas=`cat jugadasanterior | wc -l`
apuestasr=`cat jugadasranterior | wc -l`
jugadas=$((apuestas + apuestasr)) 
if [ "$jugadas" -gt "0" ] 
then
tput cup 5 65
echo "Apuestas totales: $jugadas"
oro=`grep oro pozos | cut -d":" -f1`
plata=`grep plata pozos | cut -d":" -f1`
revancha=`grep revancha pozos | cut -d":" -f1`

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
	tput cup 7 20
	echo "Numeros sorteados:"
	tput cup 8 20
	echo "5 DE ORO:"
	tput cup 8 31
	echo "$b1":"$b2":"$b3":"$b4":"$b5"-"$be"
	tput cup 9 20
	echo "5 DE ORO REVANCHA:"
	tput cup 9 39
	echo "$br1":"$br2":"$br3":"$br4":"$br5"

############################################################################# 	

grep ":$b1":"$b2":"$b3":"$b4":"$b5:" jugadas > ganadores5deoro
cantganadores=`cat ganadores5deoro | wc -l`
if [ "$cantganadores" -gt "0" ]
then
grep -v ":$b1:$b2:$b3:$b4:$b5:" jugadas > tempjugadas
rm jugadas
mv tempjugadas jugadas
fi
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$b4:" | grep ":$be:" >> ganadoresplata
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$b5:" | grep ":$be:" >> ganadoresplata
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadoresplata
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadoresplata
grep ":$b2:" jugadas | grep ":$b3:" | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadoresplata
cantgplata=`cat ganadoresplata | wc -l`
if [ "$cantgplata" -gt "0" ]
then
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b3:" | grep -v ":$b4:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b3:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b4:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b3:" | grep -v ":$b4:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b3:" | grep -v ":$b4:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
fi
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$b4:" >> ganadores4de5
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$b5:" >> ganadores4de5
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b4:" | grep ":$b5:" >> ganadores4de5
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$b4:" | grep ":$b5:" >> ganadores4de5
grep ":$b2:" jugadas | grep ":$b3:" | grep ":$b4:" | grep ":$b5:" >> ganadores4de5
cantg4de5=`cat ganadores4de5 | wc -l`
if [ "$cantg4de5" -gt "0" ]
then
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b3:" | grep -v ":$b4:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b3:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b4:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b3:" | grep -v ":$b4:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b3:" | grep -v ":$b4:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
fi
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" | grep ":$be:" >> ganadores3de5E
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b1:" jugadas | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b4:" | grep ":$be:" >> ganadores3de5E
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b2:" jugadas | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$b5:" | grep ":$be:" >> ganadores3de5E
cantg3de5E=`cat ganadores3de5E | wc -l`
if [ "$cantg3de5E" -gt "0" ] 
then
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b3:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b4:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b3:" jugadas | grep -v ":$b4:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b4:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b3:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b4:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b3:" jugadas | grep -v ":$b4:" | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
fi
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b3:" >> ganadores3de5
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b5:" >> ganadores3de5
grep ":$b1:" jugadas | grep ":$b4:" | grep ":$b5:" >> ganadores3de5
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$b5:" >> ganadores3de5
grep ":$b1:" jugadas | grep ":$b2:" | grep ":$b4:" >> ganadores3de5
grep ":$b1:" jugadas | grep ":$b3:" | grep ":$b5:" >> ganadores3de5
grep ":$b2:" jugadas | grep ":$b4:" | grep ":$b5:" >> ganadores3de5
grep ":$b3:" jugadas | grep ":$b4:" | grep ":$b5:" >> ganadores3de5
cantg3de5=`cat ganadores3de5 | wc -l`
if [ "$cantg3de5" -gt "0" ]
then 
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b3:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b4:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b3:" jugadas | grep -v ":$b4:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$b4:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b3:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b4:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas 
grep -v ":$b3:" jugadas | grep -v ":$b4:" | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
fi
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
if [ "$cantg2de5E" -gt "0" ]
then
grep -v ":$b1:" jugadas | grep -v ":$b2:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas 
grep -v ":$b2:" jugadas | grep -v ":$b3:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b3:" jugadas | grep -v ":$b4:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b4:" jugadas | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b3:" jugadas | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b4:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b5:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas 
grep -v ":$b1:" jugadas | grep -v ":$b3:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b4:" | grep -v ":$be:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
fi
grep ":$b1:" jugadas | grep ":$b2:" >> ganadores2de5
grep ":$b2:" jugadas | grep ":$b3:" >> ganadores2de5
grep ":$b3:" jugadas | grep ":$b4:" >> ganadores2de5
grep ":$b4:" jugadas | grep ":$b5:" >> ganadores2de5
grep ":$b1:" jugadas | grep ":$b5:" >> ganadores2de5
grep ":$b3:" jugadas | grep ":$b5:" >> ganadores2de5
grep ":$b1:" jugadas | grep ":$b4:" >> ganadores2de5
grep ":$b2:" jugadas | grep ":$b5:" >> ganadores2de5
grep ":$b1:" jugadas | grep ":$b3:" >> ganadores2de5
grep ":$b2:" jugadas | grep ":$b4:" >> ganadores2de5
cantg2de5=`cat ganadores2de5 | wc -l`
if [ "$cantg2de5" -gt "0" ]
then
grep -v ":$b1:" jugadas | grep -v ":$b2:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b3:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b3:" jugadas | grep -v ":$b4:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b4:" jugadas | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b3:" jugadas | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b4:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b5:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b1:" jugadas | grep -v ":$b3:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
grep -v ":$b2:" jugadas | grep -v ":$b4:" > tempjugadas
rm jugadas
mv tempjugadas jugadas
fi
grep ":$br1:$br2:$br3:$br4:$br5:" jugadasrevancha > ganadoresrevancha
cantgrevancha=`cat ganadoresrevancha | wc -l`


if [ $cantganadores -gt 0 ]
then		
	i=1

	for (( c=1; c<=$cantganadores; c++ ))
	do
		g5deoro[c]=`head -n$i ganadores5deoro | tail -n1`

		i=$((i+1))
	done
	
else 
	
	g5deoro[1]=0	  
fi
if [ $cantgplata -gt 0 ]
then
        i=1

        for (( c=1; c<=$cantgplata; c++ ))
        do
		linea=`head -n$i ganadoresplata | tail -n1`
		gplata[c]=$linea
		i=$((i+1)) 

        done

else

        gplata[1]=0
fi

if [ $cantg4de5 -gt 0 ]
then
        i=1
        for (( c=1; c<=$cantg4de5; c++ ))
        do
               	linea=`head -n$i ganadores4de5 | tail -n1`           
                g4de5[c]=$linea
                i=$((i+1))
        done

else

        g4de5[1]=0
fi
if [ $cantg3de5E -gt 0 ]
then
        i=1

        for (( c=1; c<=$cantg3de5E; c++ ))
        do
                g3de5E[c]=`head -n$i ganadores3de5E | tail -n1`
                i=$((i+1))
        done

else

        g3de5E[1]=0
fi
if [ $cantg3de5 -gt 0 ]
then
        i=1

        for (( c=1; c<=$cantg3de5; c++ ))
        do
                g3de5[c]=`head -n$i ganadores3de5 | tail -n1`
                i=$((i+1))
        done

else

        g3de5[0]=1
fi

if [ $cantg2de5E -gt 0 ]
then
        i=1

        for (( c=1; c<=$cantg2de5E; c++ ))
        do
                g2de5E[c]=`head -n$i ganadores2de5E | tail -n1`
                i=$((i+1))
        done

else

        g2de5E[1]=0
fi

if [ $cantg2de5 -gt 0 ]
then
        i=1

        for (( c=1; c<=$cantg2de5; c++ ))
        do
                g2de5[c]=`head -n$i ganadores2de5 | tail -n1`
                i=$((i+1))
        done

else

        g2de5[1]=0
fi

if [ $cantgrevancha -gt 0 ]
then
        i=1

        for (( c=1; c<=$cantgrevancha; c++ ))
        do
                grevancha[c]=`head -n$i ganadoresrevancha | tail -n1`
                i=$((i+1))
        done

else

        grevancha[1]=0
fi
# Se paga a los ganadores
if [ ${g5deoro[1]} == "0" ] 
then
aciertos=0
else
aciertos=$cantganadores
for (( c=1; c<=${#g5deoro[@]}; c++ ))
do
ganador=`echo "${g5deoro[c]}" | cut -d":" -f7`

monto=$((oro / cantganadores))
saldo=`grep $ganador usuarios | cut -d":" -f7`
nuevosaldo=$((saldo + monto))
lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`
echo `grep -v $ganador usuarios > tempusuario`
rm usuarios
mv tempusuario usuarios
echo $lineaactual":"$nuevosaldo >> usuarios
done
fi

if [ ${gplata[1]} == "0" ]
then
aplata=0
else
aplata=$cantgplata
for (( c=1; c<=${#gplata[@]}; c++ ))
do
ganador=`echo "${gplata[c]}" | cut -d":" -f7`

monto=$((plata / cantgplata))
saldo=`grep $ganador usuarios | cut -d":" -f7`
nuevosaldo=$((saldo + monto))
lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`
echo `grep -v $ganador usuarios > tempusuario`
rm usuarios
mv tempusuario usuarios
echo $lineaactual":"$nuevosaldo >> usuarios
done
fi

if [ ${g4de5[1]} == "0" ]
then
a4de5=0
else
a4de5=$cantg4de5
for (( c=1; c<=${#g4de5[@]}; c++ ))
do
ganador=`echo "${g4de5[c]}" | cut -d":" -f7`

combo=`echo "${g4de5[c]}" | cut -d":" -f8`
if [ "$combo" == "multiple6" ]
then  
	monto=7200
fi
if [ "$combo" == "multiple7" ]
then
	monto=14580
fi
if [ "$combo" == "multiple8" ]
then
	monto=21520
fi
if [ "$combo" == "multiple4" ]
then
	monto=17000
fi
if [ "$combo" == "simple" ]
then
	monto=4000
fi
saldo=`grep $ganador usuarios | cut -d":" -f7`
nuevosaldo=$((saldo + monto))
lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`
echo `grep -v $ganador usuarios > tempusuario`
rm usuarios
mv tempusuario usuarios
echo $lineaactual":"$nuevosaldo >> usuarios
done
fi

if [ ${g3de5E[1]} == "0" ]
then
a3de5E=0
else
a3de5E=$cantg3de5E
for (( c=1; c<=${#g3de5E[@]}; c++ ))
do
ganador=`echo "${g3de5E[c]}" | cut -d":" -f7`

combo=`echo "${g3de5E[c]}" | cut -d":" -f8`
if [ "$combo" == "multiple6" ]
then
        monto=2040
fi
if [ "$combo" == "multiple7" ]
then
        monto=3810
fi
if [ "$combo" == "multiple8" ]
then
        monto=6200
fi
if [ "$combo" == "multiple4" ]
then
        monto=5680
fi
if [ "$combo" == "simple" ]
then
        monto=800
fi
saldo=`grep $ganador usuarios | cut -d":" -f7`
nuevosaldo=$((saldo + monto))
lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`
echo `grep -v $ganador usuarios > tempusuario`
rm usuarios
mv tempusuario usuarios
echo $lineaactual":"$nuevosaldo >> usuarios
done
fi

if [ ${g3de5E[1]} == "0" ]
then
a3de5=0
else
a3de5=$cantg3de5
for (( c=1; c<=${#g3de5[@]}; c++ ))
do
ganador=`echo "${g3de5[c]}" | cut -d":" -f7`
combo=`echo "${g3de5[c]}" | cut -d":" -f8`
if [ "$combo" == "multiple6" ]
then
        monto=690
fi
if [ "$combo" == "multiple7" ]
then
        monto=1560
fi
if [ "$combo" == "multiple8" ]
then
        monto=2900
fi
if [ "$combo" == "multiple4" ]
then
        monto=1880
fi
if [ "$combo" == "simple" ]
then
        monto=200
fi
saldo=`grep $ganador usuarios | cut -d":" -f7`
nuevosaldo=$((saldo + monto))
lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`
echo `grep -v $ganador usuarios > tempusuario`
rm usuarios
mv tempusuario usuarios
echo $lineaactual":"$nuevosaldo >> usuarios
done
fi

if [ ${g2de5E[1]} == "0" ]
then
a2de5E=0
else
a2de5E=$cantg2de5E
for (( c=1; c<=${#g2de5E[@]}; c++ ))
do
ganador=`echo "${g2de5E[c]}" | cut -d":" -f7`

combo=`echo "${g2de5E[c]}" | cut -d":" -f8`
if [ "$combo" == "multiple6" ]
then
        monto=270
fi
if [ "$combo" == "multiple7" ]
then
        monto=600
fi
if [ "$combo" == "multiple8" ]
then
        monto=1100
fi
if [ "$combo" == "multiple4" ]
then
        monto=320
fi
if [ "$combo" == "simple" ]
then
        monto=80
fi
saldo=`grep $ganador usuarios | cut -d":" -f7`
nuevosaldo=$((saldo + monto))
lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`
echo `grep -v $ganador usuarios > tempusuario`
rm usuarios
mv tempusuario usuarios
echo $lineaactual":"$nuevosaldo >> usuarios
done
fi

if [ ${g2de5[1]} == "0" ]
then
a2de5=0
else
a2de5=$cantg2de5
for (( c=1; c<=${#g2de5[@]}; c++ ))
do
ganador=`echo "${g2de5[c]}" | cut -d":" -f7`

combo=`echo "${g2de5[c]}" | cut -d":" -f8`
if [ "$combo" == "multiple6" ]
then
        monto=120
fi
if [ "$combo" == "multiple7" ]
then
        monto=300
fi
if [ "$combo" == "multiple8" ]
then
        monto=600
fi
if [ "$combo" == "multiple4" ]
then
        monto=120
fi
if [ "$combo" == "simple" ]
then
        monto=30
fi
saldo=`grep $ganador usuarios | cut -d":" -f7`
nuevosaldo=$((saldo + monto))
lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`
echo `grep -v $ganador usuarios > tempusuario`
rm usuarios
mv tempusuario usuarios
echo $lineaactual":"$nuevosaldo >> usuarios
done
fi

if [ ${grevancha[1]} == "0" ]
then
arevancha=0
else
arevancha=$cantgrevancha
for (( c=1; c<=${#grevancha[@]}; c++ ))
do
ganador=`echo "${grevancha[c]}" | cut -d":" -f7`

monto=$((revancha / cantgrevancha))
saldo=`grep $ganador usuarios | cut -d":" -f7`
nuevosaldo=$((saldo + monto))
lineaactual=`grep $ganador usuarios | cut -d ":" -f1,2,3,4,5,6`
echo `grep -v $ganador usuarios > tempusuario`
rm usuarios
mv tempusuario usuarios
echo $lineaactual":"$nuevosaldo >> usuarios
done
fi
tput cup 11 30
echo "ACIERTOS"
tput cup 12 25
echo "5 DE ORO:"
tput cup 12 40
echo $aciertos 
tput cup 13 25
echo "POZO DE PLATA:"
tput cup 13 40
echo $aplata
tput cup 14 25
echo "4 DE 5:"
tput cup 14 40
echo $a4de5
tput cup 15 25
echo "3 DE 5 + EXTRA:"
tput cup 15 40
echo $a3de5E
tput cup 16 25
echo "3 DE 5:"
tput cup 16 40
echo $a3de5
tput cup 17 25
echo "2 DE 5 + EXTRA:"
tput cup 17 40
echo $a2de5E
tput cup 18 25
echo "2 DE 5"
tput cup 18 40
echo $a2de5
tput cup 20 55
echo "Presione 0 para salir"
opcion=5
rm ganadores5deoro
rm ganadores4de5
rm ganadores3de5E
rm ganadores3de5
rm ganadores2de5E
rm ganadores2de5
rm ganadoresplata
rm ganadoresrevancha
rm jugadas
rm jugadasrevancha
echo > jugadas
echo > jugadasrevancha
echo $aciertos":"$aplata":"$a4de5":"$a3de5E":"$a3de5":"$a2de5E":"$a2de5 >> ultimosorteo
while [ "$opcion" -ne "0" ] 
do
read -s -n 1 opcion
case $opcion in
0) sh menu.sh
;;
esac
done

else
tput cup 6 20
echo "No se puede realizar el sorteo si no hay apuestas."
tput cup 6 35
echo "Presione 0 para salir"
opcion=1
while [ "$opcion" -ne "0" ]
do
read -s -n 1 opcion
case $opcion in
0) sh menu.sh
;;
esac
done
fi
else
tput cup 6 20
echo "Los sorteos solo se realizan los días Lunes y Miercoles."
tput cup 7 20
echo "Ultimo sorteo realizado:"
aciertos=`cat ultimosorteo | cut -d":" -f1`
aplata=`cat ultimosorteo | cut -d":" -f2`
a4de5=`cat ultimosorteo | cut -d":" -f3`
a3de5E=`cat ultimosorteo | cut -d":" -f4`
a3de5=`cat ultimosorteo | cut -d":" -f5`
a2de5E=`cat ultimosorteo | cut -d":" -f6`
a2de5=`cat ultimosorteo | cut -d":" -f7`
tput cup 11 30
echo "ACIERTOS"
tput cup 12 25
echo "5 DE ORO:"
tput cup 12 40
echo $aciertos 
tput cup 13 25
echo "POZO DE PLATA:"
tput cup 13 40
echo $aplata
tput cup 14 25
echo "4 DE 5:"
tput cup 14 40
echo $a4de5
tput cup 15 25
echo "3 DE 5 + EXTRA:"
tput cup 15 40
echo $a3de5E
tput cup 16 25
echo "3 DE 5:"
tput cup 16 40
echo $a3de5
tput cup 17 25
echo "2 DE 5 + EXTRA:"
tput cup 17 40
echo $a2de5E
tput cup 18 25
echo "2 DE 5"
tput cup 18 40
echo $a2de5
tput cup 20 55
echo "Presione 0 para salir" 
opcion=5
while [ "$opcion" -ne "0" ]
do
read -s -n 1 opcion
case $opcion in
0) sh menu.sh
;;
esac
done
fi
