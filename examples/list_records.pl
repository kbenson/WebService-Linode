#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use WebService::Linode;

my $api = new WebService::Linode(
	apikey => '',
	apiurl => 'http://beta.linode.com/api/',
	debug => 5,
	fatal => 1,
	nocache => 0
);

for my $domain (@{$api->domainList}) {
	print "$domain->{domain} $domain->{type}\n";
	print "Records:\n";
	
	my $rrs = $api->domainResourceList( domainid => $domain->{domainid} );
	for my $rr ( @$rrs ) {
		printf("\t%-10s %5s %-20s\n",
			 $rr->{name}, $rr->{type}, $rr->{target}
		);
	}	
}