var1=$((1+RANDOM%4))
var2=$((1+RANDOM%4))
var3=$((1+RANDOM%4))
var4=$((1+RANDOM%4))
while [ "$var1" -eq "$var2" ] || [ "$var1" -eq "$var3" ] || [ "$var1" -eq "$var4" ]
do
var1=$((1+RANDOM%4))
done
while [ "$var2" -eq "$var1" ] || [ "$var2" -eq "$var3" ] || [ "$var2" -eq "$var4" ] 
do
var2=$((1+RANDOM%4))
done
while [ "$var3" -eq "$var1" ] || [ "$var3" -eq "$var2" ] || [ "$var3" -eq "$var4" ] 
do
var3=$((1+RANDOM%4))
done
while [ "$var4" -eq "$var2" ] || [ "$var4" -eq "$var3" ] || [ "$var4" -eq "$var1" ] 
do
var4=$((1+RANDOM%4))
done
 
num=20
num2=40
num3=50
num4=54
apuesta[$var1]=$num
apuesta[$var2]=$num2
apuesta[$var3]=$num3
apuesta[$var4]=$num4

echo ":"${apuesta[1]}":"${apuesta[2]}":"${apuesta[3]}":"${apuesta[4]}":" 

for  (( c=1; c<=6; c++ ))
do
echo "PENE"
done
