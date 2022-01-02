#!/usr/bin/env perl6
# 
# bruce_gray_example_custom_associative.raku            02 Jan 2022 

use v6;

class Foo is Associative {
    has %.secret_storage;
    multi method ASSIGN-KEY ( ::?CLASS:D: $key, $new_value ) {
        %.secret_storage{$key} = $new_value;
    }
}
my $f = Foo.new;
$f{'abc!!!'} = 123;
say $f; 





# ===
# Author:  doom@kzsu.stanford.edu

