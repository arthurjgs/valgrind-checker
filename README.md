# valgrind-checker
Simple Valgrind Checker for C program
> Made with love, to take care of your computer.

## Usage:
```shell
Usage:
  ./vg-checker.sh <path/to/valgrind-log>
Example:
  ./vg-checker.sh valgrind/output.txt
Return:
  1 You don't care about your memory (eg. free, errors, SISSEGV, ...)
      (or there was an error during the execution of the program)
  0 You care about your memory (thank you)
```
