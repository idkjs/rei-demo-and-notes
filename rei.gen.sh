#!/bin/bash
# SEE https://reasonml.chat/t/how-to-automatically-generate-interface-for-all-files/766/3
rm -rf lib/bs/rei
mkdir -p lib/bs/rei

filepath(){
  FILENAME=`echo $(basename $1)  | cut -d'-' -f 1`
  echo "lib/bs/rei/$FILENAME.rei"
}
# use 5.0.* bs-platform installed in project to generate `.rei` the 6.0.* installed globally to urn `bsdoc`
for i in $(find lib/bs/src -name '*.cmi');do
   node_modules/bs-platform/lib/bsc -bs-re-out "$(pwd)/$i" > "$(filepath $i)"
done