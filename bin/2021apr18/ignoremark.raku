#!/usr/bin/env perl6
# 
# ignoremark.raku            18 Apr 2021 

use v6;

say so 'a' ~~ rx/ä/;                # OUTPUT: «False» 
say so 'a' ~~ rx:ignoremark /ä/;    # OUTPUT: «True» 
say so 'ỡ' ~~ rx:ignoremark /o/;    # OUTPUT: «True> 

say so 'U' ~~ rx:ignoremark /Ü/;    
# True
say so 'u' ~~ rx:ignoremark /Ü/;    
# False

say so 'aU' ~~ rx:ignoremark /äÜ/;    
# True
