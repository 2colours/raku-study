#!/usr/bin/env perl6
# 
# junctions_sans_petticoats.raku            07 Nov 2021 

use v6;

my $a = 3;

if $a == 3|4 {

} 


say dostuff( any(3,4) );
say dostuff( all(3,4) );

sub dostuff( $arg ) {
    if $arg < 2 {
        return True;
    } else { 
        return False;
    }
}






# ===
# Author:  doom@kzsu.stanford.edu

