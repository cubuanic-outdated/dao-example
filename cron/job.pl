#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use DAO::Example::Utils qw/schema config/;
use Data::Dumper;
$Data::Dumper::Sortkeys=1;

unless (-e "$FindBin::Bin/../dao_example.db") {
    schema->deploy;
    schema->init;
}

print Dumper config;

print Dumper schema->resultset('Person')->active->hashref_array;

print Dumper schema->resultset('Person')->inactive->hashref_array;

print Dumper schema->resultset('Person')->by_username('plu')->prefetch_all->hashref_array;