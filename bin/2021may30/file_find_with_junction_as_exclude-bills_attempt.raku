#!/usr/bin/env perl6
# 
# file_find_with_junction_as_exclude-bills_attempt.raku            23 May 2021 

use v6;

my $exclude3 = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
my @files3 = find( dir => $loc, type => 'file', exclude => $exclude3>>.any );
say "Exclude3: ", @files3;
#Exclude3: ["/Users/me/test_folder/.DS_Store".IO "/Users/me/test_folder/godzilla".IO "/Users/me/test_folder/mothera".IO "/Users/me/test_folder/rhodan".IO]

