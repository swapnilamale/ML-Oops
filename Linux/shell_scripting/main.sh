#!/bash   
#(shebang line)

<<comment
This is the
multiline comment
comment


# ----------- Display -------------#
echo "Hello World!"



# -------------  Argument Passing in shell scripting ----------------#
echo "Total Number of Arguments : $#"
echo "All teh arguments are : $@"
echo "First Argument of the script is $1"    # Accesing Arguments given with the script
echo "Second Argument of the script is $2"





# ------------- Variable ----------------#
<<comment
- There should not be space before and after '=' operator
- User Double quotes (""), while defining a string
- Use "$" sign to operate an variable withing double quotes ("")
comment

# Defining a Variable
a=10                          # Int Variable
name="Swapnil"                  # String Variable
readonly country="INDIA"      # Defining constant Variable (Cannot be change latter)

# Accessing a Variable using '$'
echo "$a and $name in $country"

# Storing command as variable
HOSTNAME=$(hostname)
echo "Name of the machine is $HOSTNAME"




# ------------- ARRAYS ----------------#
<<comment
- values should be define space seperated
- It can store Hetergenious Datatype
- Indexes are started from 0
comment

# Defining an Array
arr=(1 2.3 "Hello" $name)

# Accessing an array element
echo "All the values in array are ${arr[*]}"       # Accessing all the values in the array
echo "Len of Array : ${#arr[*]}"                   # Accessing all the values in the array
echo "Value at the third index : ${arr[3]}"        # Value at 3rd Index (Swapnil)
echo "Value from 0 to index 2 : ${arr[*]:0:2}"     # start with the 0 index to 1 index
echo "Value from start to index 2 : ${arr[*]:2}"   # get all values from second index

# Updating array with the new values
arr+=("New" 30 40)        # Appending Elements in the array
echo "New values in the array : ${arr[*]}"


# ------------- Key Values Pair : Dict ----------------#
# Defining dict
declare -A dict
dict=([name]=Swapnil [age]=28 [city]=Noida)


echo "Name is ${dict[name]}"    # Accessing Values in dict




# -------------  String Operation ----------------#
var="I love my INDIA"
var_len=${#var}                      # Len of string
var_upper_case=${var^^}              # Upper Case
var_lower_case=${var,,}              # Lower Case 
var_replace=${var/"INDIA"/"Family"}  # Replacement
var_slice=${var:6:11}                # Slicing
echo $var_slice



# -------------  User Interactin ----------------#
read -p "What is your Name:" name
echo "Your Name is $name"




# -------------  Arithmatic Operation (+,-,*,/) ----------------#
# Using ((..)) command
echo "$((10*5))"


# -------------  comparison operator (&&,||,!)----------------#
<<comment
-gt :Greater than       ;   -ge :Greater than and equal to 
-lt :less than          ;   -le :less than and equal to 
-ne :numaric comparisn  ;   -eq :numaric comparison
 == :string comparisn   ;    == :string comparison
comment


# -------------  logical operator (&&,||,!)----------------#





# -------------  if else condition ----------------#
# 1
marks=65
if [[ $marks -gt 80 ]]        # Note there should be space at start and end of [[ __ ]]
then
    echo "First Division"
elif [[ $marks -ge 60 ]]
then 
    echo "Second Division"
else
    echo "Your are Failed"
fi

# 2
age=30
area="INDIA"
if [[ $age -gt 18 ]] && [[ $area == "INDIA" ]]
then 
    echo "You can vote"
else
    echo " You Cant Vote"
fi


# Check if we have enough number of input arguments, else leave
if [[ $# -eq 0 ]]  # len of input argument is zero then exit
then
    echo "No Input Arguments are given"
    exit 1
fi


# WAS to check given site is able to connect of now
site="www.google.com"
ping -c 1 "$site" &> /dev/null    # -c 1: send 1 ping only; &> /dev/null hides the output
if [[ $? -eq 0 ]]                 # $? = exit status of last command (0 = success)
then
    echo "Successfully connected to $site"
else
    echo "Unable to connect $site"
fi


# -------------  case condition ----------------#
echo "Provide an Option"
echo "a for print date"
echo "b for list of scripts"
echo "c to check the current location"

read choice

case $choice in 
    a)
        echo "Today's date is:"
        date
        ;;
    b)ls;;
    c)pwd;;
    *)echo "Please Provide a valid value"
esac




# -------------  for loop ----------------#
# Space Seperated Entities
for i in 1 2 3 "chebbyshef"   
do 
    echo "Entity is $i"
done

 # 1 2 3 4 5  (Using Wild Card)
for i in {1..5}    
do 
    echo "Number is $i"
done

 # Using Array
 arr=( "Dehli" "Mumbai" "Kolkata" "Chennai" )
 len_arr=${#arr[*]}
 for (( i=0;i<$len_arr;i++ ))
 do
    echo " City is ${arr[i]}"
done

# Reading file line by line
file="text.txt"
for line in $(cat $file)
do
    echo line
done


# Infinite for loop
# for (( ;;))
# do 
#     ehco "Hi"
#     sleep 2s
# done

# Accesing input arguments  in the for loop
for arg in $@
do 
    echo "Input Arguments is : $arg"
done



# -------------  while loop ----------------#
count=0
num=10

while [[ $count -le $num ]]
do 
    echo "Number is $count"
    let count++
done


# -------------  until loop ----------------#
a=10
until [[ $a -eq 1 ]]
do  
    echo $a 
    let a--
done

# Infinite Loop
# while true
# do 
#     echo "Hi"
#     sleep 2s
# done

# Read content of while using while loop
while read myVar
do  
    echo $myVar
done < text.txt


# Read content from csv file
while IFS="," read id name age
do
    echo "Id is $id"
    echo "Name is $name"
    echo "age is $age"
done < test_csv.csv

# -------------  Break and Continue and exit ----------------#


query_num=6
arr=(1 5 2 7 5 23 7 5 6)

# We need to confirm if a given no is present in array or not
for i in "${arr[@]}"
do
    if [[ $query_num -eq $i ]]
    then
        echo "$query_num is found !!!"
        break 
    fi
done

# Get only odd values in array
for i in "${arr[@]}"
do 
    let r=$i%2
    if [[ $r -eq 0 ]]
    then    
        continue 
    fi
    echo "Odd Num : $i"
done







# -------------  Function ----------------#
# Defining a function 
my_function(){
    # Taking Input in Function Defination
    local num1=$1 # First Argument
    local num2=$2 # Second Argument

    local sum=$((num1+num2))
    echo "sum of $num1 and $num2 is $sum"
    }

# Calling a function and sending argument to the function
my_function 2 4
my_function 2 -4



