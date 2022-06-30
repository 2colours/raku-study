#!/usr/bin/env perl6
# 
# string_together_last_two_into_one.raku            29 Jun 2022 

use v6;

## An example used in the slides for the Bruce Gray tutorial at tprc

{
 my @disney = <Ariel Belle Cinderella Dumbo Eeyore>;
 @disney.push( @disney.pop ~ @disney.pop );

 say @disney; # [Ariel Belle Cinderella EeyoreDumbo]
}


{
 my @disney = <Ariel Belle Cinderella Dumbo Eeyore>;
 @disney.push( do { my $b = @disney.pop; my $a = @disney.pop; $a ~ $b } );

 say @disney; # [Ariel Belle Cinderella DumboEeyore]
}


{
 my @disney = <Ariel Belle Cinderella Dumbo Eeyore>;
 @disney.push(  @disney.splice(*-2, 1) ~ @disney.pop );

 say @disney; # [Ariel Belle Cinderella DumboEeyore]
}



# ===
# Author:  doom@kzsu.stanford.edu

