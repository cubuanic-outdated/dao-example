# IMPORTANT: if you delete this file your app will not work as
# expected.  you have been warned
use inc::Module::Install;

name 'DAO-Example';
all_from 'lib/DAO/Example.pm';

requires 'Catalyst::Runtime' => '5.80003';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'parent';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
requires 'DBIx::Class';
requires 'Catalyst::Model::DBIC::Schema';
requires 'Config::JFDI';
requires 'DBIx::Class::ResultSet::HashRef';
catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
