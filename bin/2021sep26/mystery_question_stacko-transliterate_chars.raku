#!/usr/bin/env perl6
# 
# mystery_question_stacko-transliterate_chars.raku            26 Sep 2021 

use v6;

my $text = 
'MAL TIRRUEZF CR MAL RKZYIOL EX MAL OIY UAE RICF "MAL ACWALRM DYEUPLFWL CR ME DYEU MAIM UL IZL RKZZEKYFLF GH OHRMLZH';


my %translate = (
    M => T,
    A => H,
    L => E,
    C => O,
    R => F,
    E => I,
    X => S,
);
(Any other letter) = _
(Anything else) = (itself)

I have the fixed characters covered with:

tr MALCREX THEOFIS < file.txt

Or:

sed 'y/MALCREX/THEOFIS/' < file.txt

But how could I enforce the last two rules I mentioned?



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

