#! /bin/bash

#creating child script
touch childscript_beeman.sh

#add shebang to childscript
echo "#! /bin/bash" >> childscript_beeman.sh

#grep data subset from BTS data.
echo "grep BTS0[1-8] BTS_data.txt > beeman_output.txt" >> childscript_beeman.sh

#Cut needed data from perviously greped file (beeman_output.txt)
echo "cut -f1,2,4 beeman_output.txt > beeman_output2.txt" >> childscript_beeman.sh

#Take cut needed header colums from data set and add to final output file
echo "cut -f1,2,4 BTS_data.txt >> headerfile.txt" >> childscript_beeman.sh
echo "head -n1 headerfile.txt >> beeman_final.txt" >> childscript_beeman.sh

#reverse sort cut and greped data and append to final file
echo "sort -k3rg beeman_output2.txt >> beeman_final.txt" >> childscript_beeman.sh

#remove intermediate files
echo "rm beeman_output.txt beeman_output2.txt headerfile.txt" >> childscript_beeman.sh

#compress file
echo "tar -czvf Beeman_final.tar.gz beeman_final.txt" >> childscript_beeman.sh

#remove noncompressed final
echo "rm beeman_final.txt" >> childscript_beeman.sh

./childscript_beeman.sh
