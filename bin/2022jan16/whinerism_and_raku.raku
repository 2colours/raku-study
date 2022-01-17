#!/usr/bin/env perl6
# 
# whinerism_and_raku.raku            16 Jan 2022 

use v6;


# Looks like it works...
say [1, 2] eq [1, 2];
# True

say [1,2].Str;
# 1 2

# Raku sorts the key order (unlike Ruby) so they match
say {b=>2, a=>1} eq {a=>1, b=>2};
# True

say {b=>2, a=>1}.Str;
# a	1
# b	2

use Test;
is-deeply( {b=>2, a=>1}, {a=>1, b=>2} );
