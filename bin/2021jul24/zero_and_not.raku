#!/usr/bin/env perl6
# 
# zero_and_not.raku            24 Jul 2021 

use v6;

## Even though this works:
say '$333' ~~ m/^^ \$ \d+ /;  # ｢$333｣

## https://docs.raku.org/syntax/positive%20lookaround%20assertion
## The docs use this:
say '$333' ~~ m/^^ <?[$]> . \d+ /;  # «｢$333｣␤» 

## Bill raises question, why doesn't this work:
say '$333' ~~ m/^^ .  <?[$]> \d+ /;  # False


say "---";
say '333$' ~~ m/ \d+ <?[$]>/;       # ｢333｣

say '333?' ~~ m/ \d+ <?[$]>/;       # False

say '333' ~~ m/ \d+ <![$]>/;        # ｢333｣

say '333$' ~~ m/ \d+ <![$]>/;       # ｢33｣


say '1$'  ~~ m/ \d+ <?[$]>/;       #
say '$1'  ~~ m/ \d+ <?[$]>/;       #
