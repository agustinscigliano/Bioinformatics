#!/usr/bin/perl
use Bio::Perl;
use Bio::SeqIO;

# This Script creates a BLAST from a FASTA document.

# Subroutine to calculate a BLAST from a FASTA sequence
# Input: FASTA sequence path
# Output: BLAST sequence file.
# Warning: NCBI remote server is used (Internet required).
sub fastaToBlast{
	my ($fastaPath) = @_;
	#Reload FASTA sequence from file location.
	$fasta = Bio::SeqIO->new(-file => $fastaPath, -format => "fasta");
	#Calculate and write BLAST sequence
	write_blast(">$fastaPath.blast",blast_sequence($fasta->next_seq));
}
fastaToBlast($ARGV[0]);
