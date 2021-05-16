#!/usr/bin/env perl6
# 
# stripping_soft_hypens_with_whitespace.raku            16 May 2021 

use v6;

my $text = 
"Hy­phen­ation is the au­to­mated process of break­ing words be­tween lines to cre­ate more con­sis­tency across a text block.

In jus­ti­fied text, hy­phen­ation is mandatory. 
Hy­ phen ­ation";

my $text_no_ws = $text;
my $text_no_gs = $text;

$text_no_ws ~~ s:g/\w//;
say $text_no_ws;

$text_no_gs ~~ s:g/<[\w\x[00ad]]>//;
say $text_no_gs;



# ====
#  sheet of cheats

# A unicode paste board:
# «
# »
# π
# 𝑒

# use DBIish;
# my $dbh = DBIish.connect("Pg", database => 'doom', :user<doom>, :port<5434>);

# my $sth = $dbh.prepare(q:to/STATEMENT/);
#     SELECT * FROM funked_up
# STATEMENT

# $sth.execute();
# my @rows = $sth.allrows();



# external commands without shell:
# my $arg = 'Hello';
# my $captured = run('echo', $arg, :out).out.slurp;
# my $captured = run(«echo "$arg"», :out).out.slurp;


# using shell:
# my $arg = 'Hello';
# my $captured = shell("echo $arg", :out).out.slurp;
# my $captured = qqx{echo $arg};


## Try to make errors into warnings
#   CATCH { default { say "CAUGHT: ", .Str; .resume } }

# ===
# Author:  doom@kzsu.stanford.edu

