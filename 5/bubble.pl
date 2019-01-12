#!/usr/bin/env perl

use strict;

use Data::Dumper;
use Digest::MD5 qw/md5_hex/;
use File::Path qw/remove_tree/;

my $data_dir = "data";
my $data_file = "info.log";
my $total = 1_000;
my $block_size = 11; # strings

remove_tree $data_dir;
mkdir $data_dir;

# генерим файл с данными

open( FILE, sprintf( ">%s/%s", $data_dir, $data_file ) ) or die $!;

print FILE ("f" x ( $block_size - 1 ) )."\n"; # the last

foreach( 1 .. $total )	{
	printf FILE "%s\n", substr( md5_hex( time().( rand 1000000 ) ), 0, $block_size - 1 );
	printf "got %d00k\n", $_/100000 unless( $_ % 100000 );
}

close FILE;

warn "start sorting...";

open my $fh, "+<","data/info.log" or die;
binmode $fh;

my $tell = -1;
my $buf;

while( $tell ) {
	while( read( $fh, $buf, $block_size ) )	{
		if( $tell > 0 && tell( $fh ) == $tell )	{
			last;
		}
		
		my $buf2;
		if( read( $fh, $buf2, $block_size ) )	{
			if( ( $buf cmp $buf2 ) > 0 ) {
				seek( $fh, -$block_size * 2, 1 );
				print $fh $buf2;
				print $fh $buf;
			}
			
			seek( $fh, -$block_size, 1 );
		}
	}
	
	$tell = tell( $fh ) - $block_size;
	
	seek( $fh, 0, 0 );
}


