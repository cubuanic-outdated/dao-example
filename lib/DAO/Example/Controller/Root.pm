package DAO::Example::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';
use Data::Dumper;
$Data::Dumper::Sortkeys = 1;

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

DAO::Example::Controller::Root - Root Controller for DAO::Example

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index : Path : Args(0) {
    my ( $self, $c ) = @_;

    unless ( -e $c->path_to('dao_example.db') ) {
        $c->model('DB')->schema->deploy;
        $c->model('DB')->schema->init;
    }

    $c->res->print('<pre>');
    $c->res->print( Dumper $c->config );
    $c->res->print( Dumper $c->model('DB')->resultset('Person')->active->hashref_array );
    $c->res->print( Dumper $c->model('DB')->resultset('Person')->inactive->hashref_array );
    $c->res->print( Dumper $c->model('DB')->resultset('Person')->by_username('plu')->prefetch_all->hashref_array );
    $c->res->print('</pre>');
}

sub default : Path {
    my ( $self, $c ) = @_;
    $c->response->body('Page not found');
    $c->response->status(404);
}

=head1 AUTHOR

Johannes Plunien

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
