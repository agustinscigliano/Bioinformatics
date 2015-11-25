#!/usr/bin/perl;
use strict;
use Bio::SeqIO;
use Bio::Factory::EMBOSS;

# This script will calculate the ORF sequence and analyze the domains 
# of that given ORF.
# Input: a genbank compatible file path, a destination path for ORF, a destination path for motif.
# Output: ORF (in .orf extension) , Motifs (.motif) using the same destination path.
# Usage (from root folder):


# Given a nucleotide fasta secuence path (potentially coming form Ex1.pm)
# calculates ORF and saves it to a file.
# Input: A genbank file , an ouput destination
# Output: ORF in destination path (with extension)
sub calculateORF{
	my ($genBank , $proteinSeqPath)= @_;
	my $factory = Bio::Factory::EMBOSS -> new();
	my $ORF = $factory->program('getorf');
	$ORF->run({-sequence => $genBank,
               -outseq   => $proteinSeqPath});
}

# Given an ORF secuence path (potentially coming form Ex1.pm)
# calculates ORF and saves it to a file.
# Input: An ORF  sequence, an ouput destination
# Output: Motif in destination path (with extension)
sub analyzeSequenceDomains{
	my ($aminoacidSeqPath, $motifPath)= @_;
	my $factory = Bio::Factory::EMBOSS -> new();
	my $patmatmotifs = $factory->program('patmatmotifs');
	$patmatmotifs->run({
						-sequence => $aminoacidSeqPath,
						-outfile   => $motifPath,
						-full => 1 
						});
}

my $genbank = $ARGV[0];
my $ORFOutpath = $ARGV[1];
my $MotifOutpath = $ARGV[2];

calculateORF($genbank,$embossFactory,$ORFOutpath);

analyzeSequenceDomains($ORFOutpath, $MotifOutpath);
