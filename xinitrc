#!/bin/bash

setxkbmap -option caps:super
exec ssh-agent openbox-session
