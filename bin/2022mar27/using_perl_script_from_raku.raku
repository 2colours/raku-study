#!/usr/bin/env perl6
# 
# using_perl_script_from_raku.raku            27 Mar 2022 

use v6;

my $prog = '/home/doom/End/Cave/RakuStudy/Wall/raku-study/bin/2022mar27/phasehunt_fullmoon.pl';
my $captured = run($prog, :out).out.slurp.split("\n").sort;
for $captured.list -> $n {
    # say "checking n: $n";
    say $n if $n.is-prime;
}

my @werewolf_primes = run($prog, :out).out.slurp.split("\n").sort.grep( .is-prime );
say @werewolf_primes[0];
say @werewolf_primes[1];
say @werewolf_primes[2];

# external commands without shell:
# my $arg = 'Hello';
# my $captured = run('echo', $arg, :out).out.slurp;
# my $captured = run(«echo "$arg"», :out).out.slurp;


# using shell:
# my $arg = 'Hello';
# my $captured = shell("echo $arg", :out).out.slurp;
# my $captured = qqx{echo $arg};


