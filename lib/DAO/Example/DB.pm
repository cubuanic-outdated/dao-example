package DAO::Example::DB;

use strict;
use warnings;
use base qw/DBIx::Class::Schema/;

__PACKAGE__->load_namespaces( default_resultset_class => '+DAO::Example::DB::Base::ResultSet' );

sub init {
    my ($schema) = @_;
    my @roles = $schema->populate( 'Role', [ [qw/ rolename active /], [ 'Admins', 1 ], [ 'Users', 1 ], ] );
    my @persons =
      $schema->populate( 'Person', [ [qw/ username active /], [ 'plu', 1 ], [ 'guest', 1 ], [ 'inactive', 0 ], ] );
    my @personroles = $schema->populate( 'PersonRole', [ [qw/ person_id role_id active /], [ 1, 1, 1 ], [ 2, 2, 1 ], ] );
}

1;
