#!/usr/bin/env perl

use strict;

my $n = 20;

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
		warn "request -> child $i";
		sleep 2; # $ua->request
		exit;	
	}
}

for( 1 .. $n ) {
	wait();
}

warn "finish";



