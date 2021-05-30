#!/usr/bin/env perl6
# 
# bills_experiments_if_vs_ternary.raku            30 May 2021 

use v6;

## yary on basics of if:
# say if (1) {'a'} else {'nope'};
# Unsupported use of bare "say".  In Raku please use: .say if you meant
# Nope:
# .say if (1) {'a'} else {'nope'};

say do if (1) {'a'} else {'nope'};
# a
say do if (0) {'a'} else {'nope'};
# nope 

# my $str = if (1) {'a'} else {'nope'};
# say $str;
## Word 'if' interpreted as a listop; please use 'do if' to introduce the statement control word

my $str = do if (1) {'a'} else {'nope'};
say $str;
# a

my $moon_is_full = False;
my $code_ref = $moon_is_full ?? { load_sliver_bullets; hunt; } !! { rest_whole_night }; 

sub load_sliver_bullets { say "bang!"; }
sub hunt { say "tramp tramp tramp";}
sub rest_whole_night { say "zzzz"; }

$code_ref(); ## zzzz

## Daniel Sockwell irc
say (1 ?? do { my $a = 0; $a+1 } !! 'false');
# 1

# Bill's first stab...
# my $d = 0; ( if $d {my $a = 0; ($a+1).Bool} else {my $a = 0; ($a).Bool}).say;



## Bill questions

# # Starting with a series of Daniel Sockwell posts on IRC... 
# say (1 ?? do {my $a = 0; $a+1} !! 'false');
# # 1 

# # This is what I tried with if_else: 
# my $d = 0; ( if $d {my $a = 0; ($a+1).Bool} else {my $a = 0; ($a).Bool}).say;
# ## False 

# > my $d = 0; ( $d ?? {my $a = 0; ($a+1).Bool} !! {my $a = 0; ($a).Bool}).say
# -> ;; $_? is raw = OUTER::<$_> { #`(Block|140328649538984) ... } 
# > my $d = 1; ( $d ?? {my $a = 0; ($a+1).Bool} !! {my $a = 0; ($a).Bool}).say
# -> ;; $_? is raw = OUTER::<$_> { #`(Block|140328649539920) ... } 
# > my $d = 0; ( $d ?? do {my $a = 0; ($a+1).Bool} !! do {my $a = 0; ($a).Bool}).say
# False 

# say
#  (1 ?? do
#   { my $a = 0;
#     $a+1
#    } !! 'false');


# Yary

# Related, since I got in the habit of not having ’switch’ 
# with classic Perl, I often chain terneries eg: 
#  $which == 1 ?? 'one' !! $which == 2 ?? 'two' !! $which == 3 ?? 'three' !! 'huh' 

# my  $which = 1;  ## => one
# my  $which = 5;    ## => huh

for (0..5) -> $which {
   my $r = $which == 1 ?? 'one'
        !! $which == 2 ?? 'two'
        !! $which == 3 ?? 'three'
        !!                'huh'
       ; 
    say "when which is: $which, then r is $r"; 
}

# when which is: 0, then r is huh
# when which is: 1, then r is one
# when which is: 2, then r is two
# when which is: 3, then r is three
# when which is: 4, then r is huh
# when which is: 5, then r is huh



for (0..5) -> $var {
    my $r = do  ## do rears it's head again
    given $var {
         when 1  {  'one'   }
         when 2  {  'two'   }
         when 3  {  'three' }
         default {  'hud'   }
    };
    say $r;
}

for (0..5) -> $var {
    my $r = gather
    given $var {
         when 1  {  take 'one'   }
         when 2  {  take 'two'   }
         when 3  {  take 'three' }
         default {  take 'hud'   }
    };
    say $r;
}

my @numbers  = < wuhn tew thuree foah fahv sex sevhun >;
my @collection = gather 
  for @numbers -> $n {
    take $n if $n ~~ /^f/;
  }

say @collection; # [foah fahv]



for ('alpha', 'beta', 'gamma' ) -> $g {
    my $r = do  ## do rears it's head again
    given $g {
         when any( m/^b/, m/^g/ )  {  'got b or g'   }
         default {  'hud'   }
    };
    say $r;  # got b or g
}
