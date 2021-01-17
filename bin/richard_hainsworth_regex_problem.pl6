#!/usr/bin/env perl6
# 
# richard_hainsworth_regex_problem.pl6            17 Jan 2021 

## issues with parsing pod6, which includes things like this:
## X<hash|hashes, definition of; associative arrays>

use v6;
use Test;

## Make errors into warnings
CATCH { default { say "CAUGHT: ", .Str; .resume } }

#    my $bar = '\|'; # doesn't interp the way I think it should

{
    my regex fcode {
        ^ $<content>=
           (
              <-[\|]>* # anything that's not a slash
           )
           \s*         # any whitespace
           \| ?      # a single bar
           \s*
           $
        |
        ^ $<content>=[ .* \S]*\s*<?before \|>
        \|
        [\s* $<meta>=( .*? \S )\s*]+ % \;
        \s*
        $
    } 

    my @s =
    'stuff | data ; more data',
    '| data; and more',
    'stuff |',
    '|data',
    'stuff | "alpha ; beta" ; omega ',  #  very slow line
    ;

    my @expected =
    { fcode   => ｢stuff | data ; more data｣,
      content => ｢stuff｣,
      meta    => ｢data｣,
      meta    => ｢more data｣,
    },
    '',
    '',
    '',
    ;
    

    for @s {
        '---'.say;
        my $case = $_;
        say $case;
        # Note Yary's stylish way of getting elapsed time for this case...
        my $ret = $_ ~~ /<fcode>/, "\ntook ", (now - ENTER now), " sec"; 
        say $ret.WHAT;
        say $ret;
        is( $ret, @expected.pop, "fcode on case: $case" );
        '==='.say;
    }   

}


