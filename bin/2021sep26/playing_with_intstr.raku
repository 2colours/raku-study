#!/usr/bin/env perl6
# 
# playing_with_intstr.raku            26 Sep 2021 

use v6;

## NOTES

## Note: I can never remember how IntStrs work:

##       They're *like* perl's "dualvars":
##       they have two values for different contexts: a Str or an Int
##       you can't use them flexibly the other way:
##       I always want them to be something that either an integer or an integer in string form

## https://docs.raku.org/type/IntStr

## https://docs.raku.org/type/Allomorph

{
    ## What is this notation?  A list of one element?  No:
    dd <42>;
    ## IntStr.new(42, "42")
    my $a = <42>;
    ## IntStr $a = IntStr.new(42, "42")
    dd $a;
    # IntStr $int-str = IntStr.new(42, "42")
    my $int-str = <42>;
    dd $int-str;
}

{ 
  ## Makes more sense to me:
    my $f = IntStr.new(9, "nine");
    say +$f; # 9
    say ~$f; # nine
}





# ===
# Author:  doom@kzsu.stanford.edu

