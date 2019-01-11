#!/usr/bin/env perl

use strict;

die sprintf( "Usage: %s file.txt", $0 ) unless( $ARGV[0] );

open( F, $ARGV[0] ) || die sprintf( "can't open file: %s -> %s", $ARGV[0], $! );

my $line_count = 0;
my $word_count = 0;

foreach my $row ( <F> )	{
	$line_count++;
	
	my @words = split( /\s+/, $row );
	$word_count += scalar @words;
}

close( F );

printf( "%8d %8d\n", $line_count, $word_count );
 
