#!/bin/env bash
#define the filename to use as output
motd="/etc/motd"
# Collect useful information about your system
# $USER is automatically defined
HOSTNAME=`uname -n`
KERNEL=`uname -r`
CPU=`uname -p`
ARCH=`uname -m`
# The different colours as variables
W="\033[01;37m"
B="\033[01;34m"
R="\033[01;31m" 
X="\033[00;37m"
clear > $motd # to clear the screen when showing up
echo -e "$R#=============================================================================#" >> $motd
echo -e "   $W Welcome $B $USER $W to $B $HOSTNAME                " >> $motd
echo -e "   $R ARCH   $W= $ARCH                                   " >> $motd
echo -e "   $R KERNEL $W= $KERNEL                                 " >> $motd
echo -e "   $R CPU    $W= $CPU                                    " >> $motd
echo -e "$R#=============================================================================#" >> $motd
echo -e "$X" >> $motd
