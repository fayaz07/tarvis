# React build script

Builds your react app and generates a zip file including the build information.

## Usage

```bash
$ bash build.sh
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
