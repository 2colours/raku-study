#!/usr/bin/env perl6
# 
# bills_experiments_if_vs_ternary.raku            30 May 2021 

use v6;

# Starting with a series of Daniel Sockwell posts on IRC... 
say (1 ?? do {my $a = 0; $a+1} !! 'false');
# 1 
# This is what I tried with if_else: 
my $d = 0; ( if $d {my $a = 0; ($a+1).Bool} else {my $a = 0; ($a).Bool}).say;
## False 
 


say
 (1 ?? do
  { my $a = 0;
    $a+1
   } !! 'false');
