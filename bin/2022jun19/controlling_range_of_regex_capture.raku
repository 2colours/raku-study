#!/usr/bin/env perl6
# 
# controlling_range_of_regex_capture.raku            19 Jun 2022 

use v6;


# raku's '<(' and ')>' control the range of the default capture

# perl5's \K is to "keep" the part in front and substitute the remainder
# $str =~ s{ $prefix_pat \K this }{that}xms;
# \K is like <(,  )> has no perl equivalent


{
    ## zoffix example, 2018 talk
    my regex quoted { \" <( <-["]>+ )> \" }  

    my $str = q{The "rain" in Spain sprains the brain.};
    say $str;

    # change the quoted string, but leave quotes alone (or so I thought...)
    $str ~~ s/<quoted>/refrain/;

    say $str; # The refrain in Spain sprains the brain.
    # Note: refrain is *not* quoted.  Is this a BUG?

}


# Simple example from the docs, works as advertised: 
say 'abc' ~~ / a <( b )> c/;            # ｢b｣

# As does this rather weirdzo example:
say 'abc' ~~ / <(a <( b )> c)>/;        # ｢bc｣

