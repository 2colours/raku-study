#!/usr/bin/env perl6
# 
# callback_issue_demos.raku            15 Aug 2021 

use v6;

{
  my $string_thing_0  = sub {
      return "$^a | $^b";
    };  
  say $string_thing_0('hey ', 'there'); # hey  | there
}

{
  my $string_thing_1  =  {  ## not a sub, a block
      "$^a | $^b";
    };  
  say $string_thing_1('hey ', 'there'); # hey  | there
}
