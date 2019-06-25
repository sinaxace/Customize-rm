#!/bin/bash
var="$(cat <<EOF
===============================================================================
Usage: rmv [OPTION]... [FILE(s)]...
Argument Limit: Maximum 5 Files

  -d                    Stores up to five files passed onto the script in your 
                        home directory's trashbin folder (~/trashbin)
  -h                    Shows the help manual for rmv script
  -l                    Lists all files in your home directory's trashbin folder
  -s                    Shows the number of files in your trashbin
  -e                    Perminently deletes all of your trashbin's contents

This new rmv script is meant to replace the rm command by storing deleted 
files in a trashbin folder instead of perminently deleting them right away.

Note that the rmv script must have only one option on execution. It cannot
execute without the appropriate command-line arguments to read.

Also, if a trashbin folder doesnt exist in your account's home directory, rmv
will automatically create the folder for you when you first execute the script.
================================================================================
EOF
)"
echo "$var"
