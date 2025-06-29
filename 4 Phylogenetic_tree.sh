#1.	  Sequence blast.
makeblastdb -in ref.fasta -dbtype nucl -title ref -parse_seqids -out ref &
blastn -query genome.fasta -db ./ref -all -outfmt 6 -max_target_seqs 5 -out blast_result.txt -num_threads 20 &

#2.	  Sequence alignment.
mafft --adjustdirection --auto --reorder input.fasta 1> output.fasta 2> mafft.log &

#3.	  Trimming alignment.
trimal -in input.aln -out trimmed.aln -automated1&

#4.	  Phylogenetic tree.
raxml-ng --all --msa input.fasta --msa-format FASTA --model GTR --prefix tree --threads 48 --bs-trees 1000 &
