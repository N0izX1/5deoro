date=`date +%w`
if [ "$date" -eq "0" ]
then
dia="Domingo"
fi
if [ "$date" -eq "1" ]
then
dia="Lunes"
fi
if [ "$date" -eq "2" ]
then
dia="Martes"
fi
if [ "$date" -eq "3" ]
then
dia="Miércoles"
fi
if [ "$date" -eq "4" ]
then
dia="Jueves"
fi
if [ "$date" -eq "5" ]
then
dia="Viernes"
fi
if [ "$date" -eq "6" ]
then
dia="Sábado"
fi
export dia=$dia

clear
tput cup 3 40
#tput setab 4
#tput setaf 7
echo "Bienvenido al 5 de oro"
tput cup 5 43
echo "1) Crear Usuario"
tput cup 6 43
echo "2) Ingresar"
tput cup 7 43
echo "0) Salir"


opcion=4
while [ "$opcion" -ne "1" ] && [ "$opcion" -ne "2" ] && [ "$opcion" -ne "0" ] 
do
read -s -n 1 opcion
case $opcion in
	1) sh crearusuario.sh ;;
	2) sh login.sh ;;
	0) exit 2 ;;
esac
done
