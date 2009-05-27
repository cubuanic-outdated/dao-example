#!/usr/bin/env perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use DAO::Example::Utils qw/schema/;

schema->deploy;
schema->init;