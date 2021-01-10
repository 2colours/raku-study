#!/usr/bin/env perl6
# 
# reduction_operators_and_chained_substitutions.pl6            10 Jan 2021 

use v6;

## Make errors into warnings
CATCH { default { say "CAUGHT: ", .Str; .resume } }

#  my @monsters = < garuda blob golem mothera godzilla tingler >;


# These two are equivalent: 
say [+] 1, 2, 3;                # 6
say reduce &infix:<+>, 1, 2, 3; # 6

say reduce '+', 1, 2, 3; # 6

