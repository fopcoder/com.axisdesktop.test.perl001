#!/usr/bin/env perl

use strict;

my $n = 20;
my $c = 0;

for my $i (1 .. $n) {
	my $pid = fork();
	
	if( !defined $pid ) {
		warn 'fork error';
		next;
	}
	
	if( $pid )	{
		warn "fork $$ ($pid)";
	}
	else	{
		$c++;
		warn "request -> child $i";
		sleep 2; # $ua->request
		exit;	
	}
}

for( 1 .. $c ) {
	wait();
}

warn "finish";



