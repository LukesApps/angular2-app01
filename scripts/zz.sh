#!/bin/bash

### [ DEPENDENCIES ] ###
source scripts/_checks
source scripts/_operations
source scripts/_colored-logger

### [##############] ###

usage(){
    echo "                                                                                            "
    echo "                                                                                            "
    echo "                                                                                            "
    echo "This command line tool has been designed to speed up and simplify some tasks                "
    echo "                                                                                            "
    echo "  USAGE: zz <script-name> [<script-parameter>]"                                         
    echo "                                                                                            "
    echo "  possible SCRIPT NAMES (see also: zz help):"
    echo "      hotfix-setup      Setup for an hotfix, see below details"
    echo "      hotfix-push       Call this after hotfix-setup and once the bug has been fixed"
    echo "                                                                                            "
    echo "  possible PARAMETERS (with script relation):"
    echo "      hotfix-setup                                                                          "
    echo "          arguments:                                                                        "
    echo "              $1: number (number) ===> 
                            the new hotfix branch will be called 'hotfix-<number>'                    "
    echo "      hotfix-push                                                                           "
    echo "          arguments: (none)                                                                 "
    echo "                                                                                            "
    echo "                                                                                            "
    echo "                                                                                            "
}

# 1. Check whether the user is calling the script properly,
# if it's not the case, print the help
# Usage example:
# es1. zz hotfix-setup 76
# es2. zz hotfix-push 76
# first argument $1: script to call
# second argument $2: parameter for the selected script

#VARIABLES#
scriptName=$1
scriptFirstParameter=$2

set -e

#call the right script and pass the $2 argument
case $1 in
    hotfix-setup )
        source scripts/hotfix-setup $2
        exit 0
        ;;
    hotfix-push )
        source scripts/hotfix-push
        exit 0
        ;;
    help )
        usage
        exit 0
        ;;
    * )
        log "Error: You didn't specify a script name,    "
        log "please type zz help for usage informations. "
        exit 1
        ;;
esac