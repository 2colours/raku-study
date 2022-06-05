#!/usr/bin/env perl6
# 
# pushy_hashes_and_arrays.raku            05 Jun 2022 

use v6;


## Starting with an example in the docs:
{
    my @a = <a b c>;
    my @b = <d e f>;
    @a.push: @b;
    say @a; # [a b c [d e f]]
}

{
    my @a = <a b c>;
    my @b = <d e f>;
    @a.push: | @b;
    say @a; # [a b c d e f]
}

{
    my @a = <a b c>;
    my @b = <d e f>;
    @a.push: <Z X W>;
    say @a; # [a b c (Z X W)]
}

{
    my @a = <a b c>;
    my @b = <d e f>;
    @a.push: | <Z X W>;
    say @a; # [a b c Z X W]
}


{
    my @a = <a b c>;
    my @b = <d e f>;
    @a.append: <Z X W>;    # append is like push, but does a flatten...
    say @a; # [a b c Z X W]
}



{
    my @a = <a b c>;
    my @b = <d e f>;
    my @c = <X Y Z>;

    @b.push: @a;
    @c.push: @b;
    say @c;        # [X Y Z [d e f [a b c]]]
}
{
    say "===";
    my @a = <a b c>;
    my @b = <d e f>;
    my @c = <X Y Z>;

    @b.push: @a;
    @c.push: @b;
    say @c;             # [X Y Z [d e f [a b c]]]
    my @d = <whatever>;

    # aside:
    @a.push: @d;
    say @a;      # [a b c [whatever]]

    @d.append: @c;
    say @d; # [whatever X Y Z [d e f [a b c]]]

}

{
    say "===";
    my @a = <a b c>;
    my @b = <d e f>;
    my @c = <X Y Z>;

    @b.push: @a;
    @c.push: @b;
    say @c;             # [X Y Z [d e f [a b c]]]

    say @c.WHAT;

    say @c.flat;        # (X Y Z [d e f [a b c]])
    say @c.flat.WHAT;   # (Seq)

    }


