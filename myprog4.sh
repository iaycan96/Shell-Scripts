num=$1 

#--------------------------------------
if [ $# -ne 1 ]	
then
	echo "please enter 1 argument"
	exit
fi


#--------------------------------------checks if argumant is a number
re='^[0-9]+$'
if ! [[ $1 =~ $re ]] ; 
then
   echo "argument must be a number" >&2; exit
fi
#---------------------------------------

c=2 
while [ $c -le $1 ] 
do 
	flag=1 
	i=2 
 	while [ $i -lt $c ] 
 	do 
		a=`expr $c % $i` 
		if [ $a -eq 0 ] 
		then 
  			flag=0 
  		fi 
  		i=`expr $i + 1` 
	done 
 	if [ $flag -ne 0 ] 
	then 
		printf "Hexadecimal of $c is"
  		printf " %x\n" $c
 	fi 
 	c=`expr $c + 1` 
done 



 

