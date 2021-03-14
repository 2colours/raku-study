#!/usr/bin/env perl6
# 
# find_palindromes.raku            12 Mar 2021 

use v6;

my $dict = "/usr/share/dict/american-english";
{
#    for $dict.IO.open( :r ).lines  -> $word {
    my @words = gather 
    for $dict.IO.lines -> $word {
        if $word ~~ / $($word.flip) / {
            # say $word if $word.chars > 1;  # no zzz?!
            take $word if $word.chars > 1;  # no zzz?!
        }
    }

    say "count: ", @words.elems;
    say @words.sort(*.chars);
}



