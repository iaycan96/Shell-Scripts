xa=$1
xb=$2

#Function that turns ascii code to character
chr() {				
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}
#Function that turns character to ascii code
ord() {
  LC_CTYPE=C printf '%d' "'$1"
}

check1=${#1}
check2=${#2}
#------------------------------------------------------------------------- Checks if argument number is 2
if [ $# -ne 2 ]		
then
	echo "please enter 2 argument"
	exit
fi

#-----------------------------------------------------------------------------Checks if second argument is an integer
re='^[0-9]+$'
if ! [[ $2 =~ $re ]] ; then
	echo "second argument must be an integer" >&2; 
	exit
fi


##-----------------------------------------------------------------------------checks if first argument is string 
for ((i = 0 ; i < check1; i++))			
do
	chara=${xa:i:1}
	varcheck=`ord $chara`
	if [[ $varcheck -le 90 && $varcheck -ge 65 ]] || [[ $varcheck -le 122 && $varcheck -ge 97 ]]
	then
		printf ""
	else
		echo "first argument should be a string"
		exit
	fi
done
#----------------------------------------------------------------------------------If second arguments length is 1
if [ $check2 -eq 1 ];	
then
	for (( i = 0 ; i < check1; i++ ))
	do

		x=${xa:i:1}
		var=`ord $x`
		value=`expr $var + $2`
		if [ $var -le 90 ] && [ $value -ge 91 ]		
		then 
			value=`expr $value - 26`
		elif [ $var -le 122 ] && [ $value -ge 123 ]
		then 
			value=`expr $value - 26`
		fi
		lastvalue=`chr $value`
		printf "$lastvalue"
	done
	printf "\n"

#----------------------------------------------------------------------------------if first argument and second arguments lengths are equal
elif [ $check2 -eq $check1 ];
then
	for (( i = 0 ; i < check1; i++ ))
	do
		x=${xa:i:1}
		var=`ord $x`
		value=`expr $var + ${xb:i:1}`
		if [ $var -le 90 ] && [ $value -ge 91 ]
		then 
			value=`expr $value - 26`
		elif [ $var -le 122 ] && [ $value -ge 123 ]
		then 
			value=`expr $value - 26`
		fi
		lastvalue=`chr $value`
		printf "$lastvalue"
	done
	printf "\n"
else 
echo "arguments length must be equal or second arguments length must be 1"
fi

