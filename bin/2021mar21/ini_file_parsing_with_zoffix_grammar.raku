#!/usr/bin/env perl6
# 
# ini_file_parsing_with_zoffix_grammar.raku            22 Mar 2021 

use v6;

grammar INIFile {
    token TOP { <section>* }
    token section {
    }
    rule header {
    }
    rule keyvalue {
    }
    token keyster {
    }
    token value {
    }
    token ws { <!ww> \h* }
    token eol {
        \n [\h*\n]*
    }
}
