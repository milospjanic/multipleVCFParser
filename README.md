# rsIDmultipleVCFParser

This is a bash/awk script that will parse multiple individual vcf file and for your input SNP of interest output a table with VCF tags including genotype GT, genotype quality GQ, allele depth AD etc, values for VCF tags, sample names/IDs from the VCF file, input SNP ID. Useful to assess genotype and quality for a particular SNP of interest.


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
