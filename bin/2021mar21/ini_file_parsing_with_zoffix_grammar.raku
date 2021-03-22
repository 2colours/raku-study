#!/usr/bin/env perl6
# 
# ini_file_parsing_with_zoffix_grammar.raku            22 Mar 2021 

use v6;

grammar TPM {
    token key {

    }


    token section {
    }
    rule header {
    }
    rule keyvalue {
    }
    token value {
    }
    token ws { <!ww> \h* }
    token eol {
        \n [\h*\n]*
    }

    token TOP { <section>+ }
}

my $txt = q:to/END_TEXT/;
    [db]
    driver: mysql
    host: db01.example.com
    END_TEXT

{
    my $ini = INIFile.parse( $txt );
    for $ini.<section> -> $section {
        ## ...
    }
}
