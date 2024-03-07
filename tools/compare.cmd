@echo off
pushd %~dp0..
rmdir /s /q win-build 2>nul
rmdir /s /q linux-build 2>nul
echo Build for Windows
call make>windows.log 2>&1
move build win-build
echo Build for Linux
wsl ./make.sh parity>linux.log 2>&1
move build linux-build
echo Moving files into place
mkdir build
move win-build build\
move linux-build build\
move *.log build\
popd