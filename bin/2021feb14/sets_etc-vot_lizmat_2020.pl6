#!/usr/bin/env perl6
# 
# sets_etc-vot_lizmat_2020.pl6            14 Feb 2021 

use v6;
# use method-menu;
use Object::Examine;

my $s = set 2, 4, 6;
# say $s.^methods;

$s does Introspector;
say $s.menu.grep({/Set/});
# (ACCEPTS                   Set                      
# BUILDALL                  Set                      
# Baggy                     Set                      
# Bool                      Set                      
# Capture                   Set                      
# Int                       Set                      
# Mixy                      Set                      
# Num                       Set                      
# Numeric                   Set                      
# Real                      Set                      
# STORE                     Set                      
# Setty                     Set                      
# Str                       Set                      
# WHICH                     Set                      
# default                   Set                      
# elems                     Set                      
# fmt                       Set                      
# gist                      Set                      
# grab                      Set                      
# grabpairs                 Set                      
# iterator                  Set                      
# keyof                     Set                      
# maxpairs                  Set                      
# minpairs                  Set                      
# new                       Set                      
# new-from-pairs            Set                      
# of                        Set                      
# pick                      Set                      
# pickpairs                 Set                      
# raku                      Set                      
# roll                      Set                      
# total                     Set                      

say $s;      # Set(2 4 6)

say $s{2};   # True
say $s{'2'}; # False

say $s.values; # (True True True)    better than 1 1 1
say $s.keys;   # (2 4 6)

my $b = bag < a b c a a b >;
say $b; # Bag(a(3) b(2) c)

say '---';
$b does Introspector;
say $b.menu.grep({/<<Bag>>/});
say $b.menu.grep({/<<Set>>/});
