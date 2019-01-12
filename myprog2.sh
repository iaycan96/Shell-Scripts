#check the argument number
if [ $# -ne 1 ]		
then
	echo "please enter 1 argument"
	exit
fi

#reads giriş.txt line by line and add each line to an array
while read p; 
do
	giris+=("${p}")
done <giris.txt

#reads gelişme.txt line by line and add each line to an array
while read p; 
do
	gelisme+=("${p}")
done <gelisme.txt

#reads sonuç.txt line by line and add each line to an array
while read p; 
do
	sonuc+=("${p}")
done <sonuc.txt

giris1=${#giris[@]} #total number of lines in giriş.txt
gelisme1=${#gelisme[@]} #total number of lines in gelişme.txt
sonuc1=${#sonuc[@]} #total number of lines in sonuç.txt


giris2=`expr $giris1 / 2`
gelisme2=`expr $gelisme1 / 2`
sonuc2=`expr $sonuc1 / 2`


rgiris=$(( $RANDOM % $giris2 )); #creates number between 0 and number of giriş.txt
rgelisme=$(( $RANDOM % $gelisme2 )); #creates number between 0 and number of giriş.txt
rsonuc=$(( $RANDOM % $sonuc2 )); #creates number between 0 and number of giriş.txt

first=`expr $rgiris \* 2`
second=`expr $rgelisme \* 2`
third=`expr $rsonuc \* 2`


echo "${giris[$first]}" > $1 #prints giriş.txt to output file
echo " " >>$1
echo "${gelisme[$second]}" >> $1 #prints gelişme.txt to output file
echo " " >>$1
echo "${sonuc[$third]}" >> $1 #prints sonuç.txt to output file

echo "A random story is created and stored in $1."
