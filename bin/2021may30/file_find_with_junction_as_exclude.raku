#!/usr/bin/env perl6
# 
# file_find_with_junction_as_exclude.raku            20 May 2021 

use v6;
use File::Find;

## create some files to find
my $HOME = %*ENV{'HOME'};
say $HOME;
my $loc = "$HOME/tmp/monster_island";
mkdir( $loc );
chdir( $loc );
my @monsters = < godzilla mothera rhodan >;
for @monsters -> $name {
    $name.IO.spurt("The $name attacks!");
}

{
    ## without exclude, we find all 3 files
    my @files_all = find( dir => $loc, type => 'file' );
    say @files_all.elems;     # 3
}

{
    ## with a handcrafted regex we find only 2, skipping mothera as expected
    my @files_trimmed = find( dir => $loc, type => 'file', exclude => rx/<|w>[mothera|camel]$/ );    
    say @files_trimmed.elems; # 2
}

{
    ## Trying to do the same with an any junction doesn't work:
    my @exclude = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
    my @files = find( dir => $loc, type => 'file', exclude => any(@exclude) );    
    say @files;
    # [any(("/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/rhodan".IO), ("/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/mothera".IO "/home/doom/tmp/monster_island/rhodan".IO))]
    ## 
    ## (1) we end up with a single "any" junction in the first element
    ## (2) there are five hits, two redundant rhodan and godzillas, plus one mothera slips through (?)

    ## but note that this works:
    for @monsters {
        .say unless $_ ~~ any(@exclude)
    }
    # godzilla
    # rhodan

}

## raiph: precedence issues? 
{
    my @exclude = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
    my $any_exclude = any(@exclude);
    my @files = find( dir => $loc, type => 'file', exclude => $any_exclude );    
    say @files;
## [any(("/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/rhodan".IO), ("/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/mothera".IO "/home/doom/tmp/monster_island/rhodan".IO))]
}

{
    my @exclude = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
    my $any_exclude = any(@exclude);
    my @files = find( dir => $loc, type => 'file', exclude => ($any_exclude) );    
    say @files;
    # [any(("/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/rhodan".IO), ("/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/mothera".IO "/home/doom/tmp/monster_island/rhodan".IO))]
    }

{
    my @exclude = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
    my $all_exclude = all(@exclude);
    my @files = find( dir => $loc, type => 'file', exclude => $all_exclude );    
    say @files;
# [all(("/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/rhodan".IO), ("/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/mothera".IO "/home/doom/tmp/monster_island/rhodan".IO))]
}


{
    my @exclude = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
    my $any_exclude = any(@exclude);
    my @files = find( dir => $loc, type => 'file', exclude => { $any_exclude } );    
    say @files;
    # ["/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/mothera".IO "/home/doom/tmp/monster_island/rhodan".IO]
}


{
    my @exclude = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
    my $all_exclude = all(@exclude);
    my @files = find( dir => $loc, type => 'file', exclude => { $all_exclude } );    
    say @files;
    # ["/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/mothera".IO "/home/doom/tmp/monster_island/rhodan".IO]
}



# vaddim suggestion (works)
{
    my @exclude = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
    my $any_exclude = any(@exclude);
    my @files = find( dir => $loc, type => 'file', exclude => { $_ ~~ any(@exclude) } );
    say @files;
    # ["/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/rhodan".IO]
}


# variation of vaddim suggestion (works)
{
    my @exclude = ( rx/<|w>mothera$/, rx/<|w>camel$/ );
    my $any_exclude = any(@exclude);
    my @files = find( dir => $loc, type => 'file', exclude => * ~~ any(@exclude) );
    say @files;
    # ["/home/doom/tmp/monster_island/godzilla".IO "/home/doom/tmp/monster_island/rhodan".IO]
}
