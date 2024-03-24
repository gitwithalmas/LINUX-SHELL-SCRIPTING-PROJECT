#!/bin/bash


#Function to Add user

user_add(){ 
	read -p "Enter user name: " username
	sudo useradd $username
	echo "User $username is add  successfully"
}

#Function to Delete user

user_delete(){
	read -p "Enter the username to delete: " userdelete
	sudo userdel $userdelete
	echo "User $userdelete  is deleted successfully"
}

#Function to modify user

user_mod(){ 
	clear
	cat /etc/passwd
	echo "select user from above"
	read -p "Enter the username to modify : " user1
	cat /etc/group 
	echo "select group name from abover"
        read -p "Enter the groupname in which you want to add user: " grp1
	sudo usermod -aG $grp1 $user1
	echo "User $user1  is added in $grp1 group successfully. "
	cat /etc/group | grep $grp1
}


#Fuction to create a group
create_group(){
	read -p "Enter the name of group: "creategroup
	sudo groupadd $creategroup
	echo "Group $creategroup is created successfully"
}

#fuction to delete a group
delete_group(){
	read -p "Enter the group name to delete: " delgrp
	sudo groupdel $delgrp
	echo "Group is $delgrp is deleted "
}

#fuction to backup directory
backup_dir(){
	src_dir="/home/ubuntu/majeedar"
	tgt_dir="/home/ubuntu/backups"
	backup_filename="newbackup.tar.gz"
	tar -czvf "${tgt_dir}/${backup_filename}" -C "$src_dir"
	echo "Backup is created successfully"
}

#Main menu
while :; do
	echo "Choose the opion: "
	echo "1. Add User "
	echo "2. Delete User"
	echo "3. Modify User"
	echo "4. Create group"
	echo "5. Delete Group"
	echo "6. Backup Directory"
	echo "7. Exit"

	read -p "Enter your choice: " choice
	case $choice in 
		1) user_add ;;
		2) user_delete ;;
		3) user_mod ;;
		4) create_group ;;
		5) delete_group ;;
		6) backup_dir ;;
		7) exit ;;
		*) echo "Invalid choice, Plese choice again" ;;
	esac
done
