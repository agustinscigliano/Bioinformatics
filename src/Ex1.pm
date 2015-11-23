#!/usr/bin/perl -w
use strict;
use Bio::Tools::CodonTable;
use Bio::CodonUsage::Table;
use Bio::Tools::SeqStats;
use Bio::SeqIO;
use Bio::SeqUtils;
use Getopt::Long;

# This script will receive a command line argument 
# file in genBank compatible file and generate the fasta sequence
# Input: genebank compatible file, output destination path
# Output: fasta sequence, 6 sequences
# Usage (from root folder): perl src/Ex1.pm input/224831254.gb output/1
my @array;

my $in = Bio::SeqIO->new(-file => "$ARGV[0]", '-format' => 'genBank');
my @segments = ("0F","1F", "2F", "0R","1R","2R");
foreach my $i (0..5){
	$array[$i]=Bio::SeqIO->new(-file => ">$ARGV[1]/".$segments[$i].".fa", '-format' => 'Fasta');
}

my @sequences = Bio::SeqUtils->translate_6frames($in->next_seq());

foreach my $j (0..5){
    $array[$j]->write_seq($sequences[$j]);
}

