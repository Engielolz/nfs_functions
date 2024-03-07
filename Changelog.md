Version BuildSys Test
===========

* Trivial files are now built
* Most functions relating to foods are now built
  * Does not currently include scoreboard variable setup.
* Builds on both Windows and Unix-like systems
* ver_check is now built, and on Unix-like systems can show the git commit if git is installed.
  * Not available on Windows because git log output does not function in a for loop or when piped to a file.