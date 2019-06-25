#!/bin/bash
#-----Here's the link to where I learned how to use getopts(provided good explaination):
#-----https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/

#The following code is for testing getopts function in BASH for Assign3

# Absolute directory to Ubuntu Trash: ~/.local/share/Trash
while getopts ":dhlse" opt; do #getopts validates all options in the string
   case ${opt} in #opt variable checks which option was entered
    d ) #Option -d for deleting
	shift
        `mv $@ ~/trashbin` #--> Asks user if they're sure they wanna perminently delete
        echo "File(s) Moved to trash bin" #Confirmation Message
      ;;
    h ) #Option -h for help
        echo 'This rmv script is a customized version of rm command'
        echo
        echo 'rmv itself stores files that you want to remove in your home directory rmvTrash folder'
        echo
        echo 'If you do not have this folder, rmv will auto-create one for you when you first execute the command'
        echo
        echo 'Here are some of the new rmv command options: '
        echo '-d is for perminently deleting the file from your PC'
        echo '-s is for showing the amount of files stored in the rmvtrash folder'
        echo '-e is for emptying the rmvtrash folder of all files'
      ;;
    l ) #Option -l for listing trashbin contents
        echo `ls -al ~/trashbin` #Lists everything inside Trash Bin including hiddin files and permissions
      ;;
    s ) #Option -s for showing trashbin size
        echo -ne "Number of files in rmv_Trash: " #-ne for printing in same line
	echo `find ~/trashbin -type f | wc -l` #Piping regular files to wc -l counts files in directory  (find ___ -type f locates regular files in Trash Bin and wc -l counts lines) 
      ;;
    e ) #Option -e for emptying the trash bin
        echo "Are you sure you want to empty your trash bin?[Y/n]" #Prompts user to enter Y for yes or n for no
	read i
	if [ "$i" == "Y" ]; then #If user enters Y for yes...
	  `rm -r ~/trashbin/*` #deletes all contents inside Trash Bin
	  echo "-----> Trash Emptied <-----"
	  elif [ "$i" == "n" ]; then  #Else if user enters n for no...
	  echo "Operation Cancelled"
	  else #For all other inputs...
	  echo "Could not understand input, cancelling operation."
	fi
      ;;
    \? ) #Occurs if the option doesn't exist 
        echo "rmv needs VALID option (-h for help)" 
      ;;
   esac
 #Common practice is to use shift command at the end of loop for getopts
 #Moves all argument variables ($1-9) to the left so that $1 is changed to $2 and so on ($1 was an rvm option, but not anymore)
done
