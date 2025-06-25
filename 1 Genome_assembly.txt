#1.	Quality control
java -jar trimmomatic-0.39.jar PE \
rawdata/R1.fq.gz rawdata/R2.fq.gz \
cleandata/trim_pair_R1.fq.gz cleandata/unpair/trim_unpair_R1.fq.gz \
cleandata/trim_pair_R2.fq.gz cleandata/unpair/trim_unpair_R2.fq.gz \
-threads 4 -phred33 \
ILLUMINACLIP:/data/software/Trimmomatic-0.39/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:30 &

#2.	Genome assembly
spades.py -k 63 -t 8 --careful -1 trim_pair_R1.fq.gz -2 trim_pair_R2.fq.gz -o genome & done

#3.	Genome decontamination
blastn -query genome.fasta -evalue 1e-10 -outfmt '6 qseqid qlen sseqid slen pident length mismatch gapopen qstart qend sstart send evalue bitscore staxid ssciname sskingdoms' -db /home/mxn/public/sdl/blast/db/nt -out blastn_M5.out -num_threads 30 -max_target_seqs 1 &

#4.	Genomic data statistics
python quast.py -t 4 -o quast genome.fasta
