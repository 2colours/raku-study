#!/usr/bin/env perl6
# 
# file_io_array_pop.raku            26 Sep 2021 

use v6;

## Jeff question 

my $file = "/home/doom/tmp/tta.txt";

IO::CatHandle.new(:bin, $file).slurp.say;

my @array = IO::CatHandle.new(:bin, $file).slurp;
say @array.elems; # 1
say @array[0];
# say @array.pop(1);

say @array[0].^method_names;

# ===
# Author:  doom@kzsu.stanford.edu

