package DAO::Example::Utils;

use strict;
use warnings;
use base 'Exporter';
use Config::JFDI;
use DAO::Example::DB;

use vars qw/@EXPORT_OK $schema $config/;

@EXPORT_OK = qw/
  schema
  config
  /;

sub config {
    return $config if defined $config;
    $config = Config::JFDI->new( name => "DAO::Example" )->get;
    return $config;
}

sub schema {
    return $schema if defined $schema;
    $schema = DAO::Example::DB->connect( @{ config->{'Model::DB'}{connect_info} || [] } );
    return $schema;
}

1;
