#!/usr/bin/env perl6
# 
# richard_hainsworth_regex_problem.pl6            17 Jan 2021 

## Richard Hainsworth brought up a problem he had with using a regexp 
## to parse pod6 (including his own, new extensions to it).
## Specifically he wanted to parse pod6 features like this:
##   X<hash|hashes, definition of; associative arrays>

use v6;
use Test;

{
   ## Experimented with removing the incidental <?before \|>...
   ## The key fix (from Bruce Gray):
   # ^ $<content>=[ .* \S]* \s* #<?before \|> # Still slow 
   # ^ $<content>=[ .* \S]  \s* #<?before \|> # Removing the star fixes problem

   my regex fcode {
        ^ $<content>=[ <-[\|]>* \S] \s* <?before \|>
        \| \s*
        [ $<meta>=( .*? ) ]+ % [\s*\;\s*]
        \s*
        $
    } 

my @cases =
(
    { name     => 'one',
      input    => 'stuff | data ; more data',
      expected => 'result1',

    
    
    
    
    
    },
    { name     => 'two',
      input    => '| data; and more',
      expected => 'result2',
    },
    { name     => 'three',
      input    => 'stuff |',
      expected => 'result3',
    },
    { name     => 'four',
      input    => '|data',
      expected => 'result3',
    },
    { name     => 'five: very slow',
      input    => 'stuff | "alpha ; beta" ; omega ',  
      expected => 'result3',
    },

    );

      


    my @s =
    'stuff | data ; more data',
    '| data; and more',
    'stuff |',
    '|data',
    'stuff | "alpha ; beta" ; omega ',  #  very slow line
    ;
    
    for @s {
        my $case = $_;
        say $case;
        # Note the stylish way of getting an elapsed time (from Yary Hluchan)
        say $_ ~~ /<fcode>/, "\ntook ", (now - ENTER now), " sec"; 
        say "match object: ";
        dd $/;
        my $fcode_content = $/<fcode><content>;
        my @fcode_meta = $/<fcode><meta>.list;
        say "fcode_content : ", $fcode_content;
#       .say for $/<fcode><meta>.list;
        say "meta: ";
       .say for @fcode_meta;
       '==='.say;
       exit;  ## DEBUG just do the first one
    }   

}


