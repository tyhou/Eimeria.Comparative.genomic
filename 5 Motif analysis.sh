#	Motif analysis.
for i in Efla Eint Emag Emed Esti ;
do meme rabbit_hypothetical_cluster_1_fasta/${i}_hypothetical_cluster.fas -protein \
-oc ${i}_meme_zoops -nostatus -time 14400 -mod zoops -nmotifs 5 -minw 6 -maxw 100 \
-objfun classic -markov_order 0 & done
