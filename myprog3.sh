arr=( * ) #inserts all files in current directory to array

mkdir -p writable
for (( i = 0 ; i < ${#arr[@]} ; i++ ))
do
	var=`ls -l "${arr[$i]}"` 
	x=${var:2:1} 	#checks if file is write permission for user
	if [ $x = 'w' ] 
	then
		cp "${arr[$i]}" writable
	fi
done
