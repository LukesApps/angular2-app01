This command line tool has been designed to speed up and simplify some tasks

usage: zz <script-name> [<script-parameter>]

possible script names (see also: zz help):
   hotfix-setup      Setup for an hotfix, see below details
   hotfix-push       Call this after hotfix-setup and once the bug has been fixed

possible parameters (with script relation):
   hotfix-setup
      arguments:
         $1: number (number) ===> the new hotfix branch will be called 'hotfix-<number>'
   hotfix-push
      arguments: (none)

