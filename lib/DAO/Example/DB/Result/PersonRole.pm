package DAO::Example::DB::Result::PersonRole;

use strict;
use warnings;
use base qw/DAO::Example::DB::Base::Result/;

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('person_role');
__PACKAGE__->add_columns(
    person_id => {
        data_type   => 'integer',
        size        => 16,
        is_nullable => 0,
    },
    role_id => {
        data_type   => 'integer',
        size        => 16,
        is_nullable => 0,
    },
    active => {
        data_type   => 'integer',
        size        => 1,
        is_nullable => 0,
    },
);
__PACKAGE__->set_primary_key(qw/person_id role_id/);
__PACKAGE__->belongs_to( 'person', 'DAO::Example::DB::Result::Person', { id => 'person_id' } );
__PACKAGE__->belongs_to( 'role',   'DAO::Example::DB::Result::Role',   { id => 'role_id' } );

1;
