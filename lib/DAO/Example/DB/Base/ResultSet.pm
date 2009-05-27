package DAO::Example::DB::Base::ResultSet;

use strict;
use warnings;
use base qw/DBIx::Class::ResultSet::HashRef DAO::Example::DB::Base::Any/;

sub active {
    my ($rs) = @_;
    return $rs->search( { 'me.active' => 1 } );
}

sub inactive {
    my ($rs) = @_;
    return $rs->search( { 'me.active' => { '!=' => 1 } } );
}

1;
