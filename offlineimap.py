#! /usr/bin/env python3
from subprocess import check_output
from subprocess import getoutput

def get_pass():
     return check_output("security find-generic-password -w -s mutt -a xhalaa", shell=True).strip(b"\n")

def get_token():
  return subprocess.getoutput("~/jobb/tokenfile").split()[0]
