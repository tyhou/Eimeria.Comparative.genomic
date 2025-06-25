#1.	Signal peptide prediction
signalp -fasta input.fasta -org euk -gff3 -mature

#2.	Transmembrane helix prediction 
tmhmm input.fasta > output_tmhmm.txt

#3.	Prediction of glycosylphosphatidylinositol (GPI) anchors
predgpi.py  -f test.fasta -o gpi-output

#4.	Protein domain family analysis
hmmscan --domtblout output_pfam.domtblout /path/to/Pfam-A.hmm input.fasta > output_pfam.txt
