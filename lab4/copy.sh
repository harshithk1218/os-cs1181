if [ "$#" -lt 2 ]; then
usage
fi


cp $1 $2
if [ $? -eq 0 ];then
echo "Copied successfully "
else
echo "Error: Could not copy"
fi
