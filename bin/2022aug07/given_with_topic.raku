#!/usr/bin/env perl6
# 
# given_with_topic.raku            07 Aug 2022 

use v6;


given 32 {
    say $_;  # 32
    }


# given 32 {
#     $_ = 23;  # Cannot assign to an immutable value
#     say $_;
#     }

for 32 -> $_ is copy  {
    $_ = 23;  
    say $_;
}
