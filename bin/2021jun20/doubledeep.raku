#!/usr/bin/env perl6
# 
# doubledeep.raku            20 Jun 2021 

## starting over with the doubledeep.raku idea.
## Also see:
## /home/doom/End/Cave/Perl6/Wall/raku-study/bin/2021jun20/doubledeep-explorations_1.raku

use v6;

{
    my (h1, %h2) = define_some_structures();

    ## ...



}




sub define_some_structures {
    my  %g1   = ( 2015 => {  1 => { de => 177.00,
                                    fr => 191.25, },
                             2 => { de => 74.00,
                                    fr => 555.50, },
                          },
                  2016 => { 1 => { de => 177.00,
                                   fr => 191.25, },
                            2 => { de => 74.00,
                                   fr => 555.50, },
                          },
                );

    my  %g2   = ( 2015 => [   { de => 177.00,
                                fr => 191.25, },
                              { de => 74.00,
                                fr => 555.50, },
                          ],
                  2016 => [  { de => 177.00,
                               fr => 191.25, },
                             { de => 74.00,
                               fr => 555.50, },
                          ],
                );
    return (%g1, %g2);
}
