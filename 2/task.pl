#!/usr/bin/env perl

use strict;

use Data::Dumper;
use Try::Tiny;

my @arr1 = ();
my @arr2 = ();

# init

foreach( 1..10 )	{
	my $v = int rand 10;
	push @arr1, $v;
	
	$v = int rand 10;
	push @arr2, $v;
}

warn Dumper [ sort @arr1 ];
warn Dumper [ sort @arr2 ];
warn Dumper [ sort @{diff( \@arr1, \@arr2 )} ];

# check args

try {
	diff();
}
catch {
	warn $_;
};

try {
	diff([]);
}
catch {
	warn $_;
};


sub diff	{
	my $arr1 = shift or die "array1 is absent";
	my $arr2 = shift or die "array2 is absent";
	
	my %h = ();
	
	@h{ @$arr1 } = undef;
	delete @h{ @$arr2 };
	
	return [ keys %h ];
}


