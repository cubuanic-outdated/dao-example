package DAO::Example::DB::Result::Role;

use strict;
use warnings;
use base qw/DAO::Example::DB::Base::Result/;

__PACKAGE__->load_components(qw/PK::Auto Core/);
__PACKAGE__->table('role');
__PACKAGE__->add_columns(
    id => {
        data_type         => 'integer',
        size              => 16,
        is_nullable       => 0,
        is_auto_increment => 1,
    },
    rolename => {
        data_type   => 'varchar',
        size        => 32,
        is_nullable => 0,
    },
    active => {
        data_type   => 'integer',
        size        => 1,
        is_nullable => 0,
    },
);
__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many( 'personroles', 'DAO::Example::DB::Result::PersonRole', { 'foreign.role_id' => 'self.id' } );
__PACKAGE__->add_unique_constraint( unique_rolename => [qw/rolename/] );

1;
