#!/usr/bin/env perl6
# 
# catching_errors_converting_to_warning.pl6            20 Dec 2020 


use v6;

# Yary hint:
#  Experiment to turn ALL failures into warnings— at top level, “CATCH { default { .note; .resume } }” 

CATCH { default { .note; .resume } }

say '---';
{
    say 3/0;
#    CATCH { default { say .Str } };
}

say '---';
{

#    CATCH { default { say .Str } };
}
