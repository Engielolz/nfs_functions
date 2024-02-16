#!/bin/bash
# ./convert.sh file -u/-d -i/output --force-perl/--force-sed/(autodetects)
# Check if $1 is a file
if ! [[ -f $1 ]]; then echo "No file specified"; exit 1; fi
# 2nd parameter
case $2 in
   -d)
      format=0
      ;;
   -u)
      format=1
      ;;
   *)
      echo "format not specified"
      exit 1
      ;;
esac
# 3rd parameter
case $3 in
  -i)
      inplace=1
      ;;
   *)
      if [[ -z $3 ]]; then echo "file must be specified"; exit 1; fi
      inplace=0
      ;;
esac
# 4th parameter
case $4 in
   --force-perl)
      mode=1
	  ;;
   --force-sed)
      mode=0
	  ;;
   *)
      mode=0
      if [ "$(uname -s)" == "Darwin" ]; then mode=1; fi
esac

function toDOS () {
   # use sed
   if [ "$mode" == "0" ] && [ "$inplace" == "0" ]; then sed -e 's/$'"/`echo \\\r`/" $1 >$3; fi
   if [ "$mode" == "0" ] && [ "$inplace" == "1" ]; then sed -i -e 's/$'"/`echo \\\r`/" $1; fi
   # use perl (old mac os)
   if [ "$mode" == "1" ] && [ "$inplace" == "0" ]; then perl -pe 's/\r?\n|\r/\r\n/g' $1 >$3; fi
   if [ "$mode" == "1" ] && [ "$inplace" == "1" ]; then perl -pi -e 's/\r?\n|\r/\r\n/g' $1; fi
}

function toUnix () {
   # use sed
   if [ "$mode" == "0" ] && [ "$inplace" == "0" ]; then sed -e 's/\r$//' $1 >$3; fi
   if [ "$mode" == "0" ] && [ "$inplace" == "1" ]; then sed -i -e 's/\r$//' $1; fi
   # use perl (old mac os)
   if [ "$mode" == "1" ] && [ "$inplace" == "0" ]; then perl -pe 's/\r?\n|\r/\n/g' $1 >$3; fi
   if [ "$mode" == "1" ] && [ "$inplace" == "1" ]; then perl -pi -e 's/\r?\n|\r/\n/g' $1; fi

}

if [ "$format" == "0" ]; then toDOS $1 $2 $3; fi
if [ "$format" == "1" ]; then toUnix $1 $2 $3; fi
