#!/usr/bin/env perl6
# 
# strip_blank_lines_at_outset.raku            24 Jul 2021 

use v6;

# my $file ="/home/doom/tmp/lineotypoblankosity.txt";

my $file = "/home/doom/Dust/Texts/JohnDewey/essaysinexperim02dewegoog_djvu.txt";
my @lines =  $file.IO.lines;

# say @lines.elems; # 9

say @lines[200];  

