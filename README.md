# rsIDmultipleVCFParser

This is a bash/awk script that will parse multiple individual vcf file and for your input SNP of interest output a table with VCF tags including genotype GT, genotype quality GQ, allele depth AD etc, values for VCF tags, sample names/IDs from the VCF file, input SNP ID. Useful to assess genotype and quality for a particular SNP of interest.

```sh
#!/bin/bash

cat >> script.awk <<EOL

#find a line with CHROM in the vcf file, go through the fields, place in hash h1, key=position, value=field content

BEGIN { FS=" " } 

#print SNP ID

FNR==1 {printf "\nSNP: $1\t"}

#find line with #CHROM, if field contains FORMAT print next field i.e. sample name 

/#CHROM/ {for(i = 1; i <= NF; i++) if(\$i~/FORMAT/) {s=\$(i+1); printf"Sample:\t"; printf s}} 

#find line with rs ID, if field contains GT:GQ print this field and next field

/$1/ {for(i = 1; i <= NF; i++) if(\$i~/GT:GQ/) {s=\$(i+1); printf "\tTags:"; printf" "\$i"\tValues: "s}}

EOL

#list vcf files 

vcf=$(ls *SNP_INDEL.vcf)

#run awk script with $2 provided as vcf file

awk -f script.awk $vcf

rm script.awk
```
List of input vcf files \*SNP_INDEL.vcf
##Usage
<pre>
ls -ltrh *SNP_INDEL.vcf

-rwxrwxrwx 1 mpjanic users  1.2G Jul  7  2015 1410UNHS-0007_1848_1_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users 1018M Jul  7  2015 1410UNHS-0007_2102_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  989M Jul  7  2015 1410UNHS-0007_2228_1_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  1.2G Jul  7  2015 1410UNHS-0007_2305_3_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users 1007M Jul  7  2015 1410UNHS-0007_2435_5_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  974M Jul  7  2015 1410UNHS-0007_2999_1_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  964M Jul  7  2015 1410UNHS-0007_3003_5_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  930M Jul  7  2015 1411KHX-0032_1522-2_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  846M Jul  7  2015 1411KHX-0032_2105-6P_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  818M Jul  7  2015 1411KHX-0032_2139-1_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  835M Jul  7  2015 1411KHX-0032_2463-4_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  1.1G Jul  7  2015 1411KHX-0032_24635-1P_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  836M Jul  7  2015 1411KHX-0032_317155-2_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  898M Jul  7  2015 1503UNHX-0001_2989_3_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  675M Jul  9  2015 1407KHX-0008_3101801-2-3_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  950M Jul  9  2015 1503UNHX-0001_1060602_4_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  956M Jul  9  2015 1503UNHX-0001_1596_5p_SNP_INDEL.vcf
-rwxrwxrwx 1 mpjanic users  830M Jul 10  2015 1411KHX-0032_2135-5_SNP_INDEL.vcf
</pre>

Samples that contain input SNP ID will output vcf tags and values, while samples that do not contain input SNP ID will output blank after sample ID.

<pre>
chmod 755 rsIDmultipleVCFParser.sh
./rsIDmultipleVCFParser.sh rs200751313

SNP: rs200751313	Sample:	3101801-2-3	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:33:33:12:3:0,12
SNP: rs200751313	Sample:	1848_1
SNP: rs200751313	Sample:	2102	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:132:132:45:3:0,45
SNP: rs200751313	Sample:	2228_1	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:48:48:17:2:0,17
SNP: rs200751313	Sample:	2305_3	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 0/1:55:55:30:0:5,25
SNP: rs200751313	Sample:	2435_5
SNP: rs200751313	Sample:	2999_1	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:87:87:30:0:0,30
SNP: rs200751313	Sample:	3003_5	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:54:54:19:1:0,19
SNP: rs200751313	Sample:	1522-2
SNP: rs200751313	Sample:	2105-6P	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 0/1:33:33:43:1:7,36
SNP: rs200751313	Sample:	2135-5	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 0/1:37:37:14:2:2,12
SNP: rs200751313	Sample:	2139-1	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:90:90:31:3:0,31
SNP: rs200751313	Sample:	2463-4
SNP: rs200751313	Sample:	24635-1P	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 0/1:77:77:24:2:6,18
SNP: rs200751313	Sample:	317155-2	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:75:75:26:0:0,26
SNP: rs200751313	Sample:	1060602_4	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:87:87:30:3:0,30
SNP: rs200751313	Sample:	1596_5p	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:66:66:23:2:0,23
SNP: rs200751313	Sample:	2989_3	Tags: GT:GQ:GQX:DP:DPF:AD	Values: 1/1:93:93:32:2:0,32
</pre>
