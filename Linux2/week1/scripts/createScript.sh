#!/bin/bash
#Creating an empty, but runnable bash script

if [[ -n $1 ]]; then
  echo "creating script with filename: $1"
  echo  '#!/bin/bash' > "$1.sh"
  echo  '#Author: msnm' >> "$1.sh"
  echo  "#Createdon: $(date)" >> "$1.sh"
  echo  "#Purpose of $(basename $0):" >> "$1.sh"
  chmod +x "$1.sh"
  echo "Script is created"
fi
