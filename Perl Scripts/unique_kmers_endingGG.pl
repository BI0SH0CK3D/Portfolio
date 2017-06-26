#!/usr/bin/perl
use strict;
use warnings;

# sets output
open (OUTPUT ,">", "UniqueKmersEndingGG.fasta");

# declares hash
my %hash = ();

# uses sub to get just sequence data from FASTA
my $sequenceFile = getFASTA( "/scratch/Drosophila/dmel-2L-chromosome-r5.54.fasta" );

# sets window/kmer size
my $windowSize = 23;

# sets increment
my $step = 1;

# sets start and end lenth, moves wondow
for (

	# initialize window
	my $windowStart = 0;

	# "window is not more than remains in sequence"
	$windowStart <= ( length( $$sequenceFile ) -  $windowSize );

	# move alone the distance of one step
	$windowStart += $step

    )	

{
	#returns substring of kmer
	my $kmer = substr( $$sequenceFile, $windowStart, $windowSize );
	
	# this idiom adds to the hash IF it doesn't exist
	# it confised me at first because it has some logic
	# behind it that isn't explicit (the IF NOT IN) which
	# freaks out young python programmers. It's undeniably
	# handy though.
	# UPDATE: regex used to find gg		
	if ( $kmer =~ /[ATGC]{21}GG/ ) {

		$hash{$kmer}++;

	}
}
# gets sequence information from file, returns sequence 
sub getFASTA {

	# the target is what I am sending at you in array form
	my ($targetFile) = @_;

	# my sequence exists but is currently nothing
	my $sequence = "";

	# unless the file wont open for reading under this handle name
	unless ( open ( FASTA, "<", $targetFile ) ) {
		
        # bail and tell me why in the form of a scalar
		die $!;		
	}
	# while I am sending input your way
	while (<FASTA>) {

		# line is the incoming scalar
		my $line = $_;
		
		# remove the newlines from the line
		chomp($line);

		# if the line doesn't start with ">"
		if ( $line !~ /^>/ ) {
			
			# add the line to the nothing that is my sequence
			$sequence .= $line;
		}
	}
	# spit me out a reference of that sequence when done
	return \$sequence;
}

my $end = 1000;

my $count =0;

my $fastaCount = 0;

# for all the keys in my hash (aka kmers), we will call "items"
foreach my $item (keys %hash) {
	
	if ( $count < $end ) {
	
		$count++;
		
		$fastaCount++;

		#print out the "item", tab delineate, and count
		print OUTPUT ">crispr_", $fastaCount, "\n";

		print OUTPUT $item, "\n";

	}
}

# close output 
close OUTPUT;
