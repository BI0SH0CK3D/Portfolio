#!/usr/bin/perl
use strict;
use warnings;

# Canonical Introns start with GT and end with AG
my $target = "AATGGTTTCTCCCATCTCTCCATCGGCATAAAAATACAGAATGATCTAACGAA";

# make array of matches by this pattern match in target
my @matches = $target =~ /GT.*AG/g;

# easy to read output
print "Sequence: ", $target;

# print string associate with each match in array
foreach my $match (@matches) {

  print "\nIntron is: ", $match, "\n";
}


