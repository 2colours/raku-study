#!/usr/bin/env perl6
# 
# set_difference.pl6            15 Feb 2021 

## Playing with minor syntax variations in set differences,
## making sure they all work as I expect

use v6;
use Test;

say "--0--";

my @all = < godzilla blob grendel wormface mothera ghidora gammera golem rhodan >;
my @japanese = < godzilla mothera ghidora gammera rhodan >;
my @expected = < blob wormface golem >;

{
    my $result = set @all  (-) set @japanese ;
    say $result;
    say $result.WHAT;


}

{ 
    my $s_j = set @japanese;
    say $s_j;  # Set(blob godzilla grendel wormface)
    my $s_all = set @all;
    say $s_all;  # Set(gammera ghidora godzilla golem mothera rhodan)
    my $diff = $s_j (-) $s_all;
    say $diff; # Set(blob grendel wormface)
}

{
    my $result = set(@all)  (-) set(@japanese) ;
    say $result;
}

{
    my $hm = @all.Set (-) @japanese.Set ;
    say $hm;
}

{
    my $s_j = @japanese.Set;
    say $s_j;  # Set(blob godzilla grendel wormface)
}


 {
     my $ho = (set @all)  (-)  (set @japanese);
     say $ho;

 }


{
    my $ho = @all (-) @japanese;
    say $ho;


}



