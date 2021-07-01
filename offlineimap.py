#! /usr/bin/env python3
from subprocess import check_output

def get_pass():
     return check_output("security find-generic-password -w -s mutt -a xhalaa", shell=True).strip("\n")
