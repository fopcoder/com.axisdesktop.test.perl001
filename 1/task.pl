#!/usr/bin/env perl


open( F, $ARGV[0] ) || die $!; # скобки, иначе не сработает при наличии аргумента
my @lines = <F>;
my @words = map { split /\s+/ } @lines; # \s -> \s+ несколько пробельных символов подряд
printf "%8d %8d\n", scalar(@lines), scalar(@words);
close(F);

