clear
echo "Bienvenido al 5 de oro"
echo "1) Crear Usuario"
echo "2) Ingresar"
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
