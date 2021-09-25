#!/usr/bin/env perl6
# 
# 01-the_given_when_case.raku            17 Sep 2021 

use v6;

sub MAIN( $interations = 1 ) {

    my @items = ( 666, 2.71, 𝑒, "01", "whun", ('a', 'b', 'c').Set );

    for 1 .. $interations -> $i {
        say $i;
        for @items -> $item  {
            say "Checking: " ~ $item;
            say whats_my_type( $item );
        }
    }
}

sub whats_my_type ($item) {
    my $ret = 
    do  given $item  {
        when Int     {  "This is an Int"                              }
        when Rat     {  "Caught a Rat"                                } 
        when Numeric {  "This is a Numeric (but not an Int or a Rat)" } 
        #       when 'whun'  {  "Count 'whun!' "                              } # this whun *can* fire if uncommented
        when Str     {  "This is a Str"                               }
        when 'whun'  {  "This whun never fires"                       } # this is intercepted by the Str case
        default      {  "Huh?  I guess this is a: " ~ .^name          }
    }
    return $ret;
}    


# raku /home/doom/End/Cave/Perl6/bin/01-the_given_when_case.raku
# Checking: 666
# This is an Int
# Checking: 2.71
# Caught a Rat
# Checking: 2.718281828459045
# This is a Numeric (but not an Int or a Rat)
# Checking: 01
# This is a Str
# Checking: whun
# This is a Str
# Checking: b a c
# Huh?  I guess this is a: Set





# ===
# Author:  doom@kzsu.stanford.edu

