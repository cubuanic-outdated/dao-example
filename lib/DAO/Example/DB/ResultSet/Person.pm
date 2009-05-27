package DAO::Example::DB::ResultSet::Person;

use strict;
use warnings;
use base qw/DAO::Example::DB::Base::ResultSet/;

sub by_username {
    my ( $rs, $username ) = @_;
    return $rs->search( { 'me.username' => $username }, { key => 'unique_username' } );
}

sub prefetch_all {
    my ($rs) = @_;
    return $rs->search( {}, { prefetch => [ { personroles => [qw/role/] } ] } );
}

1;
