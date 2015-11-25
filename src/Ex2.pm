#!/usr/bin/perl
use Bio::Perl;
use Bio::SeqIO;

# This Script creates a BLAST from a FASTA document.

# Subroutine to calculate a BLAST from a FASTA sequence
# Input: FASTA sequence path, a destination path
# Output: BLAST sequence file.
# Warning: NCBI remote server is used (Internet required).
# Usage (from root folder): perl src/Ex2.pm output/1/0F.fa output/2
sub fastaToBlast{
	my ($fastaPath,$outPath) = @_;
	#Reload FASTA sequence from file location.
	$fasta = Bio::SeqIO->new(-file => $fastaPath, -format => "fasta");
	#Calculate and write BLAST sequence
	write_blast(">$outPath.out",blast_sequence($fasta->next_seq));
}

fastaToBlast($ARGV[0],$ARGV[1]);
