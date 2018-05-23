#!/bin/bash
#Author: msnm
#Createdon: Mi Mai 23 20:31:54 CEST 2018
#Purpose of maakwatermerk: jpg bestanden een watermerk geven

linkToLogo=${1:-"https://www.kdg.be/doc/huisstijl/Logo_V.png"}
errorDownload="Could not download the file from ${linkToLogo}"
errorCompose="Could not compose logo on file"
watermark="Logo_V.png"
#Function to download from a given link!
function downloadLogo() {
  wget ${1} >/dev/null  2>&1
#  watermark=$(wget -qO- $1 >/dev/null  2>&1)
  if [[ ${?} -ne 0 ]]; then
    echo ${errorDownload} >&2
    exit 1
  else
    echo "Download from ${linkToLogo} was succesfull!"
  fi
}

#Function to compose logo and file
function makeWatermark() {
  composite -compose bumpmap -tile ${watermark} ${1} ${2}
  if [[ ${?} -ne 0 ]]; then
    echo "${errorCompose} ${1}" >&2
    return 1
  else
    echo "Compose succesfull for ${1}"
  fi
}

#Function to eliminate white space and replace it with "_"
function noWhiteSpace() {
  echo ${1/' '//"_"}
}

#Function to change the contrast of the logo
function changeContrast() {
  convert -brightness-contrast 50x20 $1
}

# ------------- Main program ------------------------------------------------
# 1. Set the IFS to newline
IFS=$'\n'
# 2. Download the logo for the watermark
if ! [[ -f ${watermark} ]]; then
  downloadLogo ${linkToLogo}
else
  echo "${watermark} is already downloaded in the current dir"
fi

# 3. Retrieve a jpg files
files=$(find -iname "*.jpg")
# 4. Change the contrast of the logo
changeContrast $watermark
# 5. Put watermark on each file
echo ${files}
for file in ${files}; do
  nowhitespaceName=$(noWhiteSpace ${file})
  newFile=${nowhitespaceName/%jpg/watermark.jpg}
  makeWatermark ${watermark} ${file} ${newFile}
  if [[ ${?} -eq 0 ]]; then
    echo "New file with watermak is created with name ${newFile}"
  fi
done

unset IFS
