#!/usr/bin/perl;
use strict;
use Bio::SeqIO;
use Bio::Factory::EMBOSS;

# This script will calculate the ORF sequence and analyze the domains 
# of that given ORF.
# Input: a fasta secuence path, a destination path.
# Output: ORF (in .orf extension) , Motifs (.motif) using the same destination path.
# Usage (from root folder):


# Given a nucleotide fasta secuence path (potentially coming form Ex1.pm)
# calculates ORF and saves it to a file.
# Input: A fasta compatible nucleotide sequence, an ouput destination
# Output: ORF in destination path (with extension)
sub calculateORF{
	my ($fastaNucleotideSeqPath , $factory, $proteinSeqPath)= @_;
	my $ORF = $factory->program('getorf');
	$proteinSeqPath = "$proteinSeqPath.orf";#add file extension
	$ORF->run({-sequence => $fastaNucleotideSeqPath,
               -outseq   => $proteinSeqPath});
	return $proteinSeqPath;
}

# Given an ORF secuence path (potentially coming form Ex1.pm)
# calculates ORF and saves it to a file.
# Input: An ORF  sequence, an ouput destination
# Output: Motif in destination path (with extension)
sub analyzeSequenceDomains{
	my ($aminoacidSeqPath, $factory, $motifPath)= @_;
	$motifPath = "$motifPath.motifs";#add file extension
	$patmatmotifs = $factory->program('patmatmotifs');
	$patmatmotifs->run({
						-sequence => $getorfoutfile,
						-outfile   => $outfile,
						-full => 1 
						});
}

$embossFactory = Bio::Factory::EMBOSS -> new();
$proteinSeqPath= calculateORF($ARGV[0],$embossFactory);
analyzeSequenceDomains($proteinSeqPath,$embossFactory, $ARGV[1]);
