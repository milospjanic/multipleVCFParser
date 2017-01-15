#!/bin/bash

cat >> script.awk <<EOL

#find a line with CHROM in the vcf file, go through the fields, place in hash h1, key=position, value=field content

BEGIN { FS=" " } 

#print SNP ID

FNR==1 {printf "\nSNP: $1\t"}

#find line with #CHROM, if field contains FORMAT print next field i.e. sample name 

/#CHROM/ {for(i = 1; i <= NF; i++)if(\$i~/FORMAT/){s=\$(i+1);printf"Sample:\t";printf s}} 

#find line with rs ID, if field contains GT:GQ print this field and next field

/$1/ {for(i = 1; i <= NF; i++)if(\$i~/GT:GQ/){s=\$(i+1);printf "\tTags:";printf" "\$i"\tValues: "s}}

/$1/ {for(i = 1; i <= NF; i++)if(\$i~/GT:GQ/){s=\$(i+1);printf "\tGenotype:";gsub(/:.*/,"",s); print}}


EOL

#list vcf files 

vcf=$(ls *SNP_INDEL.vcf)

#run awk script with $2 provided as vcf file
awk -f script.awk $vcf

rm script.awk
