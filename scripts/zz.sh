#!/bin/bash

### [ DEPENDENCIES ] ###
source scripts/checks
source scripts/operations
source scripts/colored_logger

### [##############] ###

usage(){
    log " ******************************************************* "
    log "                                                         "
    log "  Usage: zz <script-name> <script-parameter>             "
    log "                                                         "
    log "  script-name                                                       "
    log "    hotifx-setup:                                        "
    log "      - prepares a branch from master to commit the fix  "
    log "        on;                                              "       
    log "    hotifx-push:                                         "
    log "      - pushes the fix on master branch, rebasing develop"
    log "                                                         "
    log "  script-parameters                                      "
    log "    hotifx-setup:                                        "
    log "      - first and unique parameter is the hotfix number  "
    log "    hotifx-push:                                         "
    log "      - pushes the fix on master branch, rebasing develop"
    log "                                                         "
    log " ******************************************************* "
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
        #check the parameter to be a number, else abort
        if ! [[ $2 =~ '^[0-9]+$' ]] ; then
            log "Error: Not a number" >&2; 
            exit 1
        fi
        sh hotfix-setup $2
        exit 0
        ;;
    hotfix-push )
        sh hotfix-push
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