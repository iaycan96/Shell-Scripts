while :
do	echo "" 
	echo "----------------------"
	echo "----------------------"
	echo "Please select an option:"
	echo " 1. Cipher word"
	echo " 2. Create story"
	echo " 3. Move files"
	echo " 4. Convert hexadecimal"
	echo " 5. Delete files"
	echo " 6. Exit"
	read -p "Enter your choice: " option
	echo ""
	if [ $option = "1" ]
	then
		read -p "./myprog1.sh " var1 var2
		./myprog1.sh $var1 $var2
	elif [ $option = "2" ]
	then
		read -p "./myprog2.sh " var
		./myprog2.sh $var

		echo "\$cat $var"
		echo "" 
		cat $var
		echo ""
	elif [ $option = "3" ]
	then
		echo "./myprog3.sh"
		./myprog3.sh	
	elif [ $option = "4" ]
	then
		read -p "myprog4.sh " var
		./myprog4.sh $var
	elif [ $option = "5" ]
	then
		
		read -p "myprog5.sh " var1 var2
		var1="${var1%\"}"	#deletes if first character of argument is '"'
		var1="${var1#\"}"	#deletes if first character of argument is '"'
		./myprog5.sh "$var1" $var2
	elif [ $option = "6" ]
	then 
		exit
	else 	
	echo "you should choose between 1-6"
	fi
	echo ""
	
done
