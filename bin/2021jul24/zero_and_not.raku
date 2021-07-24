#!/usr/bin/env perl6
# 
# zero_and_not.raku            24 Jul 2021 

use v6;

## Even though this works:
say '$333' ~~ m/^^ \$ \d+ /;  # ｢$333｣

## The docs use this:

say '$333' ~~ m/^^ <?[$]> . \d+ /;  # «｢$333｣␤» 

## Bill raises question, why doesn't this work:
say '$333' ~~ m/^^ .  <?[$]> \d+ /;  # False




