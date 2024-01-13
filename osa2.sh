while true; do 
	echo "Select Address Book Options\n"
	echo "1. Create"  
	echo "2. Insert" 
	echo "3. Display"
	echo "4. Delete"
	echo "5. Modify"
	echo "6. Exit "
	read -p " Enter choice " ch
	
	case "$ch" in
	
	1) echo "Enter file name"
	   read filename
	   touch $filename
	   echo "Address book created"
	;;
	
	2) echo "Enter Name::"
	read name
	 echo "class::"
	 read std
	 echo "Roll no.::"
	 read rollno
	 echo "address::"
	 read address
	 echo " Roll no. | Name | Class | Address "
	 echo " $rollno | $name | $std | $address" >> "$filename"
	 echo "record inserted"
	;;
	
	3) echo "Adress book content"
	if [ -f "$filename" ]
		then
			cat "$filename"
		else
			echo "File Does not Exist"
		fi
	;;
	
	4) echo "enter the name that u want to delete"
	   read del_name
	   sed -i "/$del_name/d" "$filename"
	   echo "Record Deleted"
	;;
	
	5)echo "Enter Roll No. to modify:"
   	  read roll_no_to_modify
 	  if grep -q "$roll_no_to_modify" "$filename"; then
        	echo "Enter new Name:"
    		read new_name
        	echo "Enter new Address:"
        	read new_address
        	echo "new class::"
	 	read new_std
        	sed -i "/$roll_no_to_modify /c \\ $roll_no_to_modify | $new_name | $new_address | $new_std" "$filename"
        	echo "Record modified."
   	 else
        	echo "Record not found."
    	fi
    	;;
	
	6) echo "Exitted..."
		exit 0
	;;
	
	esac
done

<< comment
ch=1
while [ $ch -ne 7 ]
do
	echo -e "\nEnter the choise to perform operation on Address Book "
	echo -e "1.Create Address Book \n2.Insert a Record \n3.Modify a record \n4.View Address Book \n5.Search Record in Address Book  \n6.Delete a Record  \n7.Exit"
	read ch
	case $ch in
	1)
		echo "Enter the file name"
		read filename
		touch $filename
		echo "Address Book Name $filename Created"
	;;
	
	2)
		if [ -f $filename ]
		then
			echo "Enter the Name of Person"
			read pname
			echo "Enter the Person ID"
			read pid
			echo "Enter the City Name"
			read pcity
			while [ True ]
			do
				echo "Enter the Mobile No."
				read pmob
				if [ ${#pmob} -eq 10 ]
				then
					break
				else
					echo "Enter The valid 10 Digit Mobile No."
				fi
			done

			echo -e "$pname\t$pid\t$pcity\t$pmob" >> $filename
		fi
	;;
	
	3)
		if [ -f $filename ]
		then
			echo -e "\n1.Modify the specific Record \n2.Modify all the Record"
			read ch1
			case $ch1 in
			1)
				echo -e "Enter the Person Id to get Record Line Number"
				read pidrecord
				lineno=$(grep -n $pidrecord $filename | cut -d ":" -f1)
				echo -e "Which field You Want to modify \n1.Person Name \n2.Person ID \n3.City \n4.Mobile No."
				read ch2
				case $ch2 in
				1)
					echo -e "\nEnter name of person"
					read pname
					echo -e "\nEnter Name to Modify"
					read pnamepatt
					sed -i "${lineno} s/$pname/$pnamepatt/" $filename
				;;
				
				2)
					echo -e "\nEnter ID of person"
					read pid
					echo -e "\nEnter ID to Modify"
					read pidpatt
					sed -i "${lineno} s/$pid/$pidpatt/" $filename
				;;
				
				3)
					echo -e "\nEnter city of person"
					read pcity
					echo -e "\nEnter City to Modify"
					read pcitypatt
					sed -i "${lineno} s/$pcity/$pcitypatt/" $filename
				;;
				
				4)
					echo -e "\nEnter mobile no. of person"
					read pmob
					echo -e "\nEnter Mobile No. to Modify"
					read pmobpatt
					sed -i "${lineno} s/$pmob/$pmobpatt/" $filename
				;;
				
				esac
			;;
			
			2)
				echo -e "\nEnter the Old String"
				read patternold
				echo -e "\nEnter the New String"
				read patternnew
				sed -i 's/'$patternold'/'$patternnew'/' $filename			
			;;

			esac

		else
			echo "File Does not Exist"
		fi	
	;;
	
	4)
		if [ -f $filename ]
		then
			cat $filename
		else
			echo "File Does not Exist"
		fi
	;;
	
	5)
		if [ -f $filename ]
		then
			echo -e "Enter the Person ID to search record"
			read pidpatt
			grep $pidpatt $filename
		else
			echo "File Does not Exist"
		fi
	;;
	
	6)
		if [ -f $filename ]
		then
			echo -e "Enter the Person ID to delete record"
			read pidpatt
			echo "Record deleted sucessfully"
			grep $pidpatt $filename
			sed -i '/'$pidpatt'/d' $filename
		else
			echo "File Does not Exist"
		fi
	;;
	
	7)
		echo -e "\nProgram Ended" 
	;;
	esac
done



#address_book_file="address_book.txt"

while true; do
    echo "Address Book Options:"
    echo "a) Create address book"
    echo "b) View address book"
    echo "c) Insert a record"
    echo "d) Delete a record"
    echo "e) Modify a record"
    echo "f) Exit"

    read -p "Enter your choice: " choice

    case "$choice" in
        a)
            echo "Enter the file name"
		read filename
		touch $filename
		echo "Address Book Name $filename Created"
            ;;
        b)
            echo "Address Book Contents:"
            cat "$address_book_file"
            ;;
        c)
            read -p "Enter name: " name
            read -p "Enter address: " address
            echo "Name: $name, Address: $address" >> "$address_book_file"
            echo "Record inserted."
            ;;
        d)
            read -p "Enter name to delete: " delete_name
            sed -i "/$delete_name/d" "$address_book_file"
            echo "Record deleted."
            ;;
        e)
            read -p "Enter name to modify: " modify_name
            read -p "Enter new address: " new_address
            sed -i "s/$modify_name,.*/$modify_name, $new_address/" "$address_book_file"
            echo "Record modified."
            ;;
        f)
            echo "Exiting the address book program."
            exit 0
            ;;
        *)
            echo "Invalid option. Please choose a valid option (a-f)."
            ;;
    esac
done
comment
