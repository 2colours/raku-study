#!/usr/bin/env perl6
#                                                                      c
# 01-the_given_when_case.raku            17 Sep 2021 

use v6;

my @items = ( 666, 2.71, 𝑒, "01", "whun", ('a', 'b', 'c').Set );  ## 𝑒 is a "transcendtal"
for @items -> $item  {
    say "Checking: " ~ $item;
    say whats_my_type( $item );
}

sub whats_my_type ($item) {
    my $ret = 
    do  given $item  {
        when Int     {  "   This is an Int"                              }
        when Rat     {  "   Caught a Rat"                                } 
        when Numeric {  "   This is a Numeric (but not an Int or a Rat)" } 
        #       when 'whun'  {  "Count 'whun!' "                           } # this whun *can* fire if uncommented
        when Str     {  "   This is a Str"                               }
        when 'whun'  {  "   This whun never fires"                       }   # this whun is intercepted by the Str case
        default      {  "   I guess this is a: " ~ .^name                }
    }
    return $ret;
}    


# raku /home/doom/End/Cave/Perl6/bin/01-the_given_when_case.raku
# Checking: 666
#    This is an Int
# Checking: 2.71
#    Caught a Rat
# Checking: 2.718281828459045
#    This is a Numeric (but not an Int or a Rat)
# Checking: 01
#    This is a Str
# Checking: whun
#    This is a Str
# Checking: b a c
#    I guess this is a: Set


## given/when checks each case in order
##   including the "default" which should always be at the end
##   checking for specific case "whun" *after* general case Str won't do anything


# ===
# Author:  doom@kzsu.stanford.edu

