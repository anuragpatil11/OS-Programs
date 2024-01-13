# 4. Sort the Array using bubble Sort. Test if a string is a palindrome.

#!/bin/bash

# Function to perform Bubble Sort
bubble_sort() {
  local array=("$@")
    local n=${#array[@]}
    
    for ((i = 0; i < n-1; i++)); do
        for ((j = 0; j < n-i-1; j++)); do
            if ((array[j] > array[j+1])); then
                # Swap elements
                temp=${array[j]}
                array[j]=${array[j+1]}
                array[j+1]=$temp
            fi
        done
    done
    echo "${array[@]}"
}

# Function to check if a string is a palindrome
is_palindrome() {
    local input=$1
    local reversed=""
    # Reverse the input string
    for ((i = ${#input} - 1; i >= 0; i--)); do
        reversed="$reversed${input:i:1}"
    done
    if [ "$input" == "$reversed" ]; then
        echo "The string is a palindrome."
    else
        echo "The string is not a palindrome."
    fi
}

# Input: array of integers
#read -p "Enter space-separated integers for sorting: " -a input_array

arr=(5 4 3 2 1)
echo "Original array ${arr[@]}"

# Call the bubble_sort function and pass the input array
sorted_array=($(bubble_sort "${arr[@]}"))

# Output: sorted array
echo "Sorted array: ${sorted_array[@]}"

# Input: string for palindrome check
read -p "Enter a string to check for palindrome: " input_string

# Call the is_palindrome function and pass the input string
is_palindrome "$input_string"



