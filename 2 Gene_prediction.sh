#1.	Gene prediction.
autoAugTrain.pl --genome= ref.fasta --trainingset= ref.gff --species= ref
augustus --species= ref --gff3=on genome.fasta > genome_augustus.gff3

gmes_petap.pl --ES --cores 40 --sequence genome.fasta  --v --format GFF3

Launch_PASA_pipeline.pl  -c alignAssembly.config -C -R -g example.fa.masked -t transcript.fasta.clean -T -u transcript.fasta --ALIGNERS blat --CPU 12 &

#2.	Combine and filter annotations.
EVidenceModeler --sample_id genome.fasta  --weights weights.txt --genome genome.fasta --gene_predictions gene_predictions.gff3 --protein_alignments protein_alignments.gff3 --transcript_alignments transcript_alignments.gff3 --segmentSize 100000 --overlapSize 10000
agat_sp_filter_incomplete_gene_coding_models.pl --gff genome.gff3 --fasta genome.fasta -o genome_complete.gff3

#3.	tRNA prediction.
tRNAscan-SE -o tRNA.out -f tRNA.ss -m tRNA.stats Cp_IId_11730_genome.fasta

#4.	rRNA prediction.
barrnap --kingdom euk --threads 40 --outseq rRNA.fa Cp_IId_11730_genome.fasta > rRNA.gff3

