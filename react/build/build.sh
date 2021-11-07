#!/bin/bash

# Beware of changing the script if you are a beginner in bash
# Ths script includes deleting the old build and temp diretory
# Any unknown change in the script will cause the build to fail and might harm your system

echo $'Hi '$USER''
echo $'I am tarvis, your build assistant!'
echo $'Please have a coffee until I build your application...\n'

timestamp=$(date +%s)
timestamp_formatted=$(date -d @$timestamp)
echo $'Started build at: '$timestamp_formatted''

echo $'\n1. Installing node-modules...'
npm install --no-audit
echo $'\nDone installing node-modules.\n'

echo $'2. Building application...\n'
npm run build
echo $'\nDone building application.\n'

if [[ -d "temp" ]]; then
  echo $'\nAwesome, temp directory already exists'
else
  echo $'3. Creating temp directory...'
  mkdir temp
fi

echo $'4. Moving the build directory to ./temp'
mv build temp/build

echo $'5. Creating build info file'
touch temp/info.json

echo $'6. Calculating the size build has used...'
dirInfo=$(du -sh ./temp/build)
dirInfoArr=($dirInfo)

echo $'7. Writing build info file...'

lastCommitMessage=$(git log -1 --format=%s)
lastCommitId=$(git log -1 --format=%H)
gitBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')

buildInfo="{ 
  \"build\": { 
    \"timestamp\": \"${timestamp}\", 
    \"size\": \"${dirInfoArr[0]}\", 
    \"commit\":\"${lastCommitId}\", 
    \"commitMessage\": \"${lastCommitMessage}\",
    \"branch\": \"${gitBranch}\" 
  }, 
  \"author\": { 
    \"who\": \"$USER\" 
  }, 
  \"machine\": { 
    \"arch\": \"$(uname --m)\", 
    \"os\": \"$(uname -v)\" 
  } 
}"
echo $buildInfo >> temp/info.json


zipFileName="build_$timestamp.zip"

echo $'8. Zipping build files...'
cd ./temp
zip -r $zipFileName .
mv $zipFileName ../
cd ..

echo $'9. Deleting temp and build dirs'
rm -rf ./temp/
# rm -rf ./build

timestamp=$(date +%s)
timestamp_formatted=$(date -d @$timestamp)
echo $'\nFinished build at: '$timestamp_formatted''

echo $'\nHurray! I am done. Thanks for using me as your build assistant. Have a bugless production build!'
