#!/usr/bin/env perl6
# 
# substitution_using_a_callback.pl6            17 Jan 2021 

use v6;

## Make errors into warnings
# CATCH { default { say "CAUGHT: ", .Str; .resume } }


my $str = "aaa bbb ccc ddd";

my $coderef =
   {  $0.uc; };

# $str ~~ s/(<<\w>>)/ $coderef() /;
$str ~~ s/(\b\w\b)/ 123 /;

say $str;


