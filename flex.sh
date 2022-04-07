if [ "$1" = "" ] 
then
    echo "Please enter parameters..."
    echo ""
    exit 1
fi

dist=${1%.*}
flex $1

out_file=$PWD"/lex.yy.c"
while ! test -e $out_file
do
    echo "waiting ... "
    sleep 1
done

in_file=$out_file
out_file=$dist

gcc -o $out_file $in_file 

out_file=$PWD"/"$out_file
while ! test -e $out_file
do
    echo "compiling ... "
    sleep 1
done

out_file=$PWD"/lex.yy.c"
rm -f $out_file 
