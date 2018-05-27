#!/bin/bash
#Creating an empty, but runnable bash script

if [[ -n $1 ]]; then
  echo "creating script with filename: $1"
  echo  '#!/bin/bash' > "$1.sh"
  echo "#=========================================================" >> "$1.sh"
  echo  '#Author: Michael Schoenmaekers' >> "$1.sh"
  echo  "#Createdon: $(date)" >> "$1.sh"
  echo  "#Version: 1.0" >> "$1.sh"
  echo  "#Purpose of $1:" >> "$1.sh"
  echo "#Toolset:" >> "$1.sh"
  echo '## Check if command is installed: command -v ab >/dev/null 2>&1 || { echo "Error" >&2; exit 1 }' >> "$1.sh"
  echo '## Default Value: ${var:-default}'>> "$1.sh"
  echo '## Error Value: ${var?error_message}'>> "$1.sh"
  echo '## Replace: ${string/vervang_deze_string/door_deze_string}'>> "$1.sh"
  echo '### Replace all: ${string//vervang_deze_string/door_deze_string}'>> "$1.sh"
  echo '## Replace begin or end: ${string/#vervang_deze_string/door_deze_string} or ${string/%vervang_deze_string/door_deze_string}'>> "$1.sh"
  echo '## Substring: ${string:positie:lengte}'>> "$1.sh"
  echo '## Trim: {string#a*b} {string##a*b} {string%a*b} {string%%a*b}'>> "$1.sh"
  echo '## Lower upper count:  ${string,,} ${string^^}  ${#string}'>> "$1.sh"
  echo '## $@ in combi met SHIFT als een script schrijft met ./script optie1 file1 file2 ...'>> "$1.sh"
  echo "#=========================================================" >> "$1.sh"
  chmod +x "$1.sh"
  echo "Script is created"
fi
