# React build script

Builds your react app and generates a zip file including the build information.

## Pre requisites

```bash
1. Node.js
2. NPM
3. React
4. Git
5. zip/unzip
```

## Usage

```bash
bash build.sh
```

## Sequence of steps it performs

1. Installing node-modules
2. Building application
3. Creating temp directory
4. Moving the build directory to ./temp
5. Creating build info file
6. Calculating the size build has used
7. Writing build info file
8. Zipping build files
9. Deleting temp and build dirs

## Tech/tools

<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/react/react-original.svg" alt="React" width="64" height="64" /> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/git/git-plain.svg" alt="Git" width="64" height="64"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bash/bash-plain.svg" alt="Bash" width="64" height="64"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/nodejs/nodejs-plain.svg" alt="Node.js" height="64" width="64"/> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/npm/npm-original-wordmark.svg" alt="npm" height="64" width="64">
