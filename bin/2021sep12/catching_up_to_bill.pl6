#!/usr/bin/env perl6
# 
# catching_up_to_bill.pl6            12 Sep 2021 

use v6;

my $var = False;
say $var;
# False
say ++$var;
# True
say $var;
# True

say $var++;
# True 
say $var;
# True

say "---";

say $var.Int;  # 1
say $var + 1;  # 2

say $var - 2;
say $var.Bool;


# ===
# Author:  doom@kzsu.stanford.edu

