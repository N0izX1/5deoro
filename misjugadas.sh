clear
sh cabecera.sh
echo "Mis jugadas:"
grep $usuario jugadas
tput cup 4 50
echo " 0 - Salir"
opcion=1
while [ "$opcion" -ne "0" ] 
do
read -s -n 1 opcion
case $opcion in 
0) menu.sh ;;
esac
done

