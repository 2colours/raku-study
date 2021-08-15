#!/usr/bin/env perl6
# 
# classic_arrays.raku            15 Aug 2021 

use v6;

## In which I review using arrays/lists/etc with object classes
## and try to pin down whatever it is that keeps tripping up my
## perl-damaged brain.

say "===";
{ my @nothing  = < nada nope bupkes >;
  say @nothing;         # [nada nope bupkes]
  say @nothing[2];      # bupkes

  my @sweet = @nothing;
  say @sweet;           # [nada nope bupkes]   (( wait, that worked? ))

  my @zero = < zero zip zed >;
  my @all_nothing = @nothing, @zero;
  say @all_nothing;        # [[nada nope bupkes] [zero zip zed]]

  my @nihilism = flat @nothing, @zero;
  say @nihilism; # [nada nope bupkes zero zip zed]

  my @nihilism_too = | @nothing, | @zero;
  say @nihilism_too; # [nada nope bupkes zero zip zed]

  my @up = set @nothing;
  dd @up;               # Array @up = [Set.new("bupkes","nada","nope")]

  # my Set $upper = @nothing;
  # Type check failed in assignment to $upper; expected Set but got Array (["nada", "nope", "bu...)

  # my Set $upper = flat @nothing;
  # Type check failed in assignment to $upper; expected Set but got Seq (("nada", "nope", "bu...)

  my $upper = @nothing.Set;
  dd $upper;            # Set $upper = Set.new("bupkes","nope","nada")

  my $over = Set.new( @nothing );
  dd $over;
  # Set $over = Set.new("nope","bupkes","nada")

  my Set $irish = @nihilism.Set;
  dd $irish;


}








# ====
#  sheet of cheats



# ===
# Author:  doom@kzsu.stanford.edu


