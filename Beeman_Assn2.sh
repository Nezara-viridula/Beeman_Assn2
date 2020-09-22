#! /bin/bash

#creating child script
touch childscript_beeman.sh

#add shebang to childscript
echo "#! /bin/bash" >> childscript_beeman.sh

#grep data subset from BTS data.
echo "for Num in {10..89}; do grep 13BTS0$'Num' BTS_data.txt; done >> beeman_output.txt" >> childscript_beeman.sh



