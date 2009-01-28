#!/usr/local/bin/perl

use strict;
use warnings;

use lib '../lib';

use Net::Twitter::Cabal::Config;

my $file = 'samplecfg.yml';
my $config = Net::Twitter::Cabal::Config->new( { file => $file } );
