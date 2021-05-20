#!/usr/bin/env perl6
# 
# file_find_with_junction_as_exclude.raku            20 May 2021 

use v6;
use File::Find;

my $loc = '/home/doom/tmp/grep_me';
mkdir( $loc );
chdir( $loc );


my @monsters = < godzilla mothera rhodan tingler wolfman dracula horta blob >;


my @exclude = (
    rx/mothera/,
    rx/camel/
    );

my @files = find( dir => $loc, type => 'file', exclude => any(@exclude) );    
