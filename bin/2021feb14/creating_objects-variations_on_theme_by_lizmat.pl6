#!/usr/bin/env perl6
# 
# creating_objects-variations_on_theme_by_lizmat.pl6            14 Feb 2021 

## Elizabeth Mattijsen (sp) 
## Deutscher Perl-/Raku-Workshop 2020

# comparison object creation and hash creation
#   time raku -e 'class Point { has $.x; has $.y }; for ^1_000_000 { Point.new( x => 42, y => 666) }'
#   time raku -e 'for ^1_000_000 { my %p = x => 42, y => 666 }'
# 0.5s vs 1.66s

use v6;

class Point {
    has $.x;
    has $.y };

for ^1_000_000 {
    my $assign =   ## Added for B
      Point.new( x => 42,
                 y => 666)
    }

# run order: co A, ch, co A, ch, co B

# time ./creating_objects-variations_on_theme_by_lizmat.pl6

## first run (first use of raku today)
# real	0m3.345s
# user	0m1.752s
# sys	0m0.048s

## second run:
# real	0m1.577s
# user	0m1.676s
# sys	0m0.036s

## first run of "co B":
# real	0m1.678s
# user	0m1.772s
# sys	0m0.040s



# time ./creating_hashes-variations_on_theme_by_lizmat.pl6

## first run:
# real	0m5.869s
# user	0m5.948s
# sys	0m0.036s

# ## second run:
# real	0m5.781s
# user	0m5.860s
# sys	0m0.032s
