#!perl -T

use Test::More tests => 2;

BEGIN {
	use_ok( 'Net::Twitter::Cabal::Tweet' );
}

diag( "Testing Net::Twitter::Cabal::Tweet $Net::Twitter::Cabal::Tweet::VERSION, Perl $], $^X" );

my $nick = 'joe';
my $text = 'Some extremely witty remark';
my $tweet = Net::Twitter::Cabal::Tweet->new( {
	poster  => $nick,
	content => $text,
} );

isa_ok( $tweet, 'Net::Twitter::Cabal::Tweet' );