#!/usr/bin/env perl6
# 
# regex_append_to_sudoers_line.raku            28 Feb 2021 

use v6;
use Test;

## using sysadmin tools that allow an input pattern and replace,
## but no other elements.  pcre, perl5 compatible (but crippled)

# 298. [very hard] Given a line from /etc/sudoers, 

#      Write a regex that will append /usr/local/bin to the secure_path line. 
#      Do not append if /usr/local/bin is already present. 
#      The secure_path line looks like this.

# Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin

# 'Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin' =>
# 'Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin',

# 'Defaults secure_path = /bin:/usr/local/bin:/root/bin' =>
# 'Defaults secure_path = /bin:/usr/local/bin:/root/bin',

## Something like replace \1:/usr/local/bin but only if it doesn't match already

my @cases = (
             [ 'Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin',
               'Defaults secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin',
               'Appends new path'],
             [ 'Defaults secure_path = /bin:/usr/local/bin:/root/bin',
               'Defaults secure_path = /bin:/usr/local/bin:/root/bin',
               'Declines to append because path is already in the MIDDLE'],
             [ 'Defaults secure_path = /bin:/root/bin:/usr/local/bin',
               'Defaults secure_path = /bin:/root/bin:/usr/local/bin',
               'Declines to append because path is already at the END'],
             [ 'Defaults secure_path = /usr/local/bin:/bin:/root/bin',
               'Defaults secure_path = /usr/local/bin:/bin:/root/bin',
               'Declines to append because path is already at the START'],

             );

# say @cases;

{
    my $label = 'Testing raku translation of perl regex';
    for @cases -> $case {
        say '---';
        my ($input, $expected, $sublabel) = $case.values;

        my $pattern =
        rx/
        ^
        (   # Begin capture
            <-[=]>*?  \=  \s+   # Begin after  'Defaults secure_path = '
            <!before              
             [  
               [ <-[:]>*? \: ]*       
               '/usr/local/bin' 
               [ \: | $ ]
             ]
           >   
            .*  ## matches *everything* but only if the negative lookahead does not match
        )   # End capture
        $
        /;

        my $append = ':/usr/local/bin';

        my $result = $input;
        $result
        ~~ s/$pattern/$0$append/ ;  ## does $0 work to embed the previous capture here?

        say "i watch dollar 0: ", $0;  # Nil
        say 'result: ', $result;

        is( $result, $expected, "$label: $sublabel" );

    }


    ## reference, the p5 regex I'm trying to convert here:
    #       qr{
    #           ^ 
    #           (        # Capture to $1
    #           [^=]*?   =  \s+   # Begin after  'Defaults secure_path = '
    #           (?!       #  A zero-width negative lookahead assertion.
    #             (?:     
    #               [^:]* 
    #               : 
    #             )*       
    #             /usr/local/bin
    #             (?: 
    #               :   | 
    #               $    ) 
    #           )
    #           .*  ## matches *everything* but only if the negative lookahead does not match
    #           )        # End $1 capture
    #           $
    #         }

}




{
    say "===";
    ## playing fragments above the above regex

    say "XXX = 666" ~~ /<-[=]>*? \=  \s+/;  # ｢XXX = ｣

    my $pat = /<-[=]>*? \=  \s+/;
    say "XXX = 666" ~~ $pat ;               # ｢XXX = ｣


    say ":/usr/trash/bin:/home/lostfool/bin" ~~ / [ <-[:]>*? \: ]* /; # ｢:/usr/trash/bin:｣

    # demanding a leading non-colon fails?  But why wouldn't "n:" match?
    # is it the non-greedy causing problems?
    say ":/usr/trash/bin:/home/lostfool/bin" ~~ / [ <-[:]>+? \: ]* /; # ｢｣   

    # nope: same behavior
    say ":/usr/trash/bin:/home/lostfool/bin" ~~ / [ <-[:]>+ \: ]* /;  # ｢｣

    # this matches:
    say "x:" ~~ / [ <-[:]>+ \: ]* /;     # ｢x:｣
    say "x:z" ~~ / [ <-[:]>+ \: ]* /;    # ｢x:｣
    say "x:y:z" ~~ / [ <-[:]>+ \: ]* /;  # ｢x:y:｣  ## the * repeats the two-char match

    say "xX:yY:zZ" ~~ / [ <-[:]>+ \: ]* /;  # ｢xX:yY:｣   ## the + repeats the non-colon match


    say "xX:yY:zZ" ~~ / <-[:]>+ \: /;  # ｢xX:｣   ## without the wrapping []*, only one chunk 
    say "xX:yY:zZ" ~~ / <-[:]>* \: /;  # ｢xX:｣   ## same behavior with a * not a +


    say ":y" ~~ / <-[:]>+ \: /;  # Nil  ## + requires a non-colon before a colon
    say ":y" ~~ / <-[:]>* \: /;  # ｢:｣  ## * is okay with zero non-colons before colon


#      ^
#      (   # Begin capture
#          <-[=]>*?  \=  \s+   # Begin after  'Defaults secure_path = '
#          <!before              
#              [  
#                [ <-[:]>*? \: ]*       
#                '/usr/local/bin' 
#                [ \: | $ ]
#              ]
#            >   
#          .*  ## matches *everything* but only if the negative lookahead does not matchp
#      )   # End capture
#      $

}

{ ## a bigger fragment, matching for the /usr/local/bin
    say "===";
#    my $pattern = /      ## executes match on $_ immediately?
    my $pattern = rx/
                 (   # Begin capture
                   [ <-[:]>*? \: ]*       
                   '/usr/local/bin'   ## '/' needs quote, particularly with // delimiters
                   [ \: | $ ]
                 )   # End capture
                  /;


#        $pattern = '(local)';
#        $input ~~ m/$pattern/;  ## Q: why does this $pattern work raw, without {$pattern} (( DOES IT? ))
#        $input ~~ m/(local)/;    ## This works, above line does not.

#    $pattern = rx/(local)/;
#    say $pattern.WHAT; # (Regex)
#    say $pattern;      # rx/(local)/

    my regex pattern {(local)};

#    for @cases -> $case {
    for @cases>>.[0] -> $input {
#        my $input = $case.values.[0];
        say "input: $input";
#        $input ~~ m/  $pattern  /;   # NG
#        $input ~~ m/  {$pattern}  /; # NG
#        $input ~~ / {$pattern}  /;   #  NG
#        $input ~~ /$pattern/;        #  NG
#        $input ~~ /<$pattern>/;       #  NG
## Conclusion: this is stupid.  Read the docs again, idjit.

#        $input ~~ /<pattern>/;       #  NG.  WTF?
#        $input ~~ m/<pattern>/;       #  NG.  

        my $ret = 
          $input ~~ m/<pattern>/;       #  

        say $ret;
        # ｢local｣
        #  pattern => ｢local｣
        #   0 => ｢local｣
        say $ret.WHAT;  # (Match)

        say $0;    # Nil    ## This is the *real* WTF, why isn't the 0 match in $0 now?
                            ## hidden inside the named "pattern" namespace inside match object?
        say '---';
    }
}


## Duh: rx//

## https://docs.raku.org/type/Regex
## To match a string against a regex, you can use the smartmatch operator:

## my $match = 'abc' ~~ rx/ ^ab /;


## Predefined character classes:
##   https://docs.raku.org/language/regexes#Predefined_character_classes


##



## Note this style, no equals but declare as a regex (I like the curlies):

## https://docs.raku.org/language/regexes-best-practices
## my regex float { <[+-]>?\d*'.'\d+[e<[+-]>?\d+]? }



## https://docs.raku.org/type/Regex

# To match a string against a regex, you can use the smartmatch operator:

# my $match = 'abc' ~~ rx/ ^ab /;


# Or you can evaluate the regex in Boolean context, in which case it matches against the $_ variable

# $_ = 'abc';
# if / ^ab /  { ... }
