#!/usr/bin/env perl6
# 
# rosettacode_counting_basepairs.raku            10 Oct 2021 

use v6;


my $dna = join '', lines q:to/END/;
    CGTAAAAAATTACAACGTCCTTTGGCTATCTCTTAAACTCCTGCTAAATG
    CTCGTGCTTTCCAATTATGTAAGCGTTCCGAGACGGGGTGGTCGATTCTG
    AGGACAAAGGTCAAGATGGAGCGCATCGAACGCAATAAGGATCATTTGAT
    GGGACGTTTCGTCGACAAAGTCTTGTTTCGAGAGTAACGGCTACCGTCTT
    CGATTCTGCTTATAACACTATGTTCTTATGAAATGGATGTTCTGAGTTGG
    TCAGTCCCAATGTGCGGGGTTTCTTTTAGTACGTCGGGAGTGGTATTATA
    TTTAATTTTTCTATATAGCGATCTGTATTTAAGCAATTCATTTAGGTTAT
    CGCCGCGATGCTCGGTTCGGACCGCCAAGCATCTGGCTCCACTGCTAGTG
    TCCTAAATTTGAATGGCAAACACAAATAAGATTTAGCAATTCGTGTAGAC
    GACCGGGGACTTGCATGATGGGAGCAGCTTTGTTAAACTACGAACGTAAT
    END
 
put pretty($dna, 80);

my @result = $dna.comb.Bag.pairs; 

# for ('A', 'C', 'G', 'T') -> $k {
#     say $r{ $k }
# }



foreach my $item (@items) {
## ...
}






# put "\nTotal bases: ", +my $bases = $dna.comb.Bag;
put "\nTotal bases: ",
my $bases = $dna.comb.Bag;
say $bases;
say +$bases;

put $bases.sort(~*.key).join: "\n";
 
sub pretty ($string, $wrap = 50) {
    $string.comb($wrap).map( { sprintf "%8d: %s", $++ * $wrap, $_ } ).join: "\n"
}



# ===
# Author:  doom@kzsu.stanford.edu

