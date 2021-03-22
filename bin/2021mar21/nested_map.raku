#!/usr/bin/env perl6
# 
# nested_map.raku            21 Mar 2021 

use v6;

## Make errors into warnings
### CATCH { default { say "CAUGHT: ", .Str; .resume } }

my @mat = ( ( 3, 7, 9 ),
            ( 2, 4, 6 ),
            ( 13, 17, 23 ),
            );

say @mat;
