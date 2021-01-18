# Introduction

This repository contains a simple script that can be used when moving repositories from one Bitbucket team to another. This is intended to be run on each developer's machine in order to fix git remotes.

The script is "smart" and will not move update a remote without verifying that it exists. If the migration is done over a longer period of time then this script can be run by developers multiple times.

Make sure you read through the script before running it. :)

# How to run

This script should be run a Bash terminal.

* Update the two variables at the top of the script. SOURCE_TEAM should be set to the name of the source Bitbucket team and DST_TEAM to the destination team
* Enable execution of the script by running chmod +x fixOrigins.sh
* Position yourself in your code directory. This should be the directory where you keep your repositories
* Run the script (./bitbucket-remotes-migration/fixOrigins.sh or similar)
* Wait. The script will verify that each remote exists which takes time
* Check output
