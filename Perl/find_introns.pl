#!/usr/bin/perl
use strict;
use warnings;

# Canonical Introns start with GT and end with AG
my $target = "AATGGTTTCTCCCATCTCTCCATCGGCATAAAAATACAGAATGATCTAACGAA";

# make array of matches using this pattern match in target
my @matches = $target =~ /GT.*AG/g;

# print update
print "Sequence: ", $target;

# print string associate with each match in array
foreach my $match (@matches) {

  print "\nIntron is: ", $match, "\n";
}


