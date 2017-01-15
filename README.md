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

/#CHROM/ {for(i = 1; i <= NF; i++)if(\$i~/FORMAT/){s=\$(i+1);printf"Sample:\t";printf s}} 

#find line with rs ID, if field contains GT:GQ print this field and next field

/$1/ {for(i = 1; i <= NF; i++)if(\$i~/GT:GQ/){s=\$(i+1);printf "\tTags:";printf" "\$i"\tValues: "s}}

EOL

#list vcf files 

vcf=$(ls *SNP_INDEL.vcf)

#run awk script with $2 provided as vcf file

awk -f script.awk $vcf

rm script.awk
```

##Usage
<pre>
mpjanic@valkyr:/home/odin/mpjanic/WGS/HCASMC/vcf_2$ ls -ltrh *SNP_INDEL.vcf
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
