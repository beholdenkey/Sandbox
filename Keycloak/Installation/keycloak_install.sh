#!/bin/bash
# Created by @beholdenkey
echo "Keycloak"
echo "Please be advised"
echo "System will reboot upon completion"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
    echo "Acknowledged"
  else
    echo "Aborted"
  fi
