#!/usr/bin/env perl6
#                                                                       
# multi_dispatch_with_positionals.raku                             23 Sep 2021 

use v6;

## demo of type specificity, the List and Array versions can 
## take precedence over the general Positional version:

my @monsters = < godzilla mothera ghidora gammera golem wormface >;
my @heroes   = < beowulf maynard_g_krebs bluebeetle bernie mothera godzilla >;

multi sub speak (List $l) {
    say "The 3rd element of the List: $l[2]" if $l[2];
}
multi sub speak (Array $a) {
    say "The 3rd element of the Array: $a[2]" if $a[2];
}
multi sub speak (Positional $a) {
    my $type = $a.^name;
    say "The 3rd element of a $type: $a[2]" if $a[2];
}

## All three cases here are "Positional", but we have multis for
## the more specific Array and List cases, so only the last one
## calls the Positional multi:
speak( @monsters );                  # The 3rd element of the Array: ghidora
speak( <beowulf bernie mothera> );   # The 3rd element of the List: mothera
speak( 1..3 );                       # The 3rd element of a Range: 3

# Note: ranges are positional:
#   https://docs.raku.org/type/Positional

