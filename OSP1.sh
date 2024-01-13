#!/bin/bash

address_book_file="address_book.txt"

# Function to create an address book
create_address_book() {
    touch "$address_book_file"
    echo "Address book created."
}

# Function to display address book
display_address_book() {
    if [ -s "$address_book_file" ]; then
        cat "$address_book_file"
    else
        echo "Address book is empty."
    fi
}

# Function to insert a record
insert_record() {
	    echo "Enter Roll No.:"
    	    read roll_no
            echo "Enter Name:"
            read name
            echo "Enter Age:"
            read age
            echo "Enter Address:"
            read address
            echo "Enter Phone No.:"
            read phone
            echo "Enter Branch:"
            read branch
            echo "Enter Year or Class:"
            read year
    	    echo "$roll_no|$name|$address|$phone|$age|$branch|$year" >> "$address_book_file"
            echo "Record inserted."
}

# Function to delete a record
delete_record() {
    echo "Enter Name to delete:"
    read name_to_delete
    if grep -q "$name_to_delete" "$address_book_file"; then
        sed -i "/$name_to_delete/d" "$address_book_file"
        echo "Record deleted."
    else
        echo "Record not found."
    fi
}

# Function to modify a record
modify_record() {
    echo "Enter Roll No. to modify:"
    read roll_no_to_modify
    
    if grep -q "$name_to_modify" "$address_book_file"; then
        echo "Enter new Name:"
    	read new_name
        echo "Enter new Address:"
        read new_address
        echo "Enter new Phone Number:"
        read new_phone
        echo "Enter new Age:"
        read new_age
        echo "Enter new Branch:"
        read new_branch
        echo "Enter new Year:"
        read new_class
        sed -i "s/$roll_no_to_modify/c\\$roll_no_to_modify|$new_name|$new_address|$new_phone|$new_age|$new_branch|$new_class" "$address_book_file"
        echo "Record modified."
    else
        echo "Record not found."
    fi
}

# Main program loop
while true; do
    echo "Address Book Menu:"
    echo "1) Create address book"
    echo "2) Display address book"
    echo "3) Insert a record"
    echo "4) Delete a record"
    echo "5) Modify a record"
    echo "6) Exit"
    read -p "Enter your choice: " choice
    case $choice in
        1) create_address_book ;; # create function is called
        2) display_address_book ;; # display  function is called
        3) insert_record ;; # insert function is called
        4) delete_record ;; # delete function is called
        5) modify_record ;; # modify function is called
        6) echo "Exiting..."; exit ;;
        *) echo "Invalid choice. Please select a valid option." ;;
    esac
done

<< comment
Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 1
Address book created.

Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 2
3|uday|bhopal|8736221|18|entc|te
4|aditya|jaipur|1344664|19|cse|te

Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 3
Enter Roll No.:
5
Enter Name:
mohan
Enter Age:
13
Enter Address:
nepa
Enter Phone No.:
245466
Enter Branch:
civil
Enter Year or Class:
be
Record inserted.

Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 2

3|uday|bhopal|8736221|18|entc|te
4|aditya|jaipur|1344664|19|cse|te
5|mohan|nepa|245466|13|civil|be

Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 4

Enter Name to delete:
mohan
Record deleted.

Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 2

3|uday|bhopal|8736221|18|entc|te
4|aditya|jaipur|1344664|19|cse|te

Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 5

Enter Roll No. to modify:
3
Enter new Name:
ayush
Enter new Address:
nagpur
Enter new Phone Number:
1234546
Enter new Age:
21
Enter new Branch:
it
Enter new Year:
te
Record modified.

Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 2

3|ayush|nagpur|1234546|21|it|te
3|ayush|nagpur|1234546|21|it|te

Address Book Menu:
1) Create address book
2) Display address book
3) Insert a record
4) Delete a record
5) Modify a record
6) Exit
Enter your choice: 6
Exiting...
comment
