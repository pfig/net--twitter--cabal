package Net::Twitter::Cabal::Config;

use base 'Class::Accessor::Fast';
__PACKAGE__->mk_accessors( qw/
	file
	config
	name
	description
	jid
	password
	twitter
	twitterpw
	accept
	/
);

use Config::Any;
use Carp;


=head1 NAME

Net::Twitter::Cabal::Config - Process Net::Twitter::Cabal's configuration

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

Inside a cabal-controlling program:

	my $config = Net::Twitter::Cabal::Config->new( { file => "config.yml" } );
	...

=head1 FUNCTIONS

=head2 new

Instantiate a new Config object. Needs a file name:

	my $config = Net::Twitter::Cabal::Config->new( "config.yml" );
	...
	
=cut

sub new {
	my $proto = shift;
	my $class = ref $proto || $proto;
	
	my $self = $class->SUPER::new( @_ );
	
	croak "I need a configuration file.\n" unless $self->file;
	my $file = $self->file;
	
	my $config = Config::Any->load_files( {
		files           => [ $file ],
		use_ext         => 1,
		flatten_to_hash => 1,
	} );

	my $cabal = $config->{$file};
	$self->name( $cabal->{name} );
	$self->description( $cabal->{description} ) if $cabal->{description};
	$self->jid( $cabal->{jid} );
	$self->password( $cabal->{password} );
	$self->twitter( $cabal->{twitter} );
	$self->twitterpw( $cabal->{twitterpw} );
	$self->accept( $cabal->{accept} );

	my @required = qw/
		name
		jid
		password
		twitter
		twitterpw
		accept
	/;
	my $success = 1;
	for my $attr ( @required ) {
		unless ( $self->$attr ) {
			$success = 0;
			last;
		}
	}

	return $success? $self : undef;
}

=head2 dump

Dump a cabal configuration:

	my $config = Net::Twitter::Cabal::Config->new( "config.yml" );
	$config->dump;

=cut

sub dump {
	my $self = shift;
		
	use Data::Dumper;
	print Dumper $self->config;
}

=head1 AUTHOR

Pedro Figueiredo, C<< <me at pedrofigueiredo.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-net-twitter-cabal at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Net-Twitter-Cabal>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Net::Twitter::Cabal::Config


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Net-Twitter-Cabal>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Net-Twitter-Cabal>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Net-Twitter-Cabal>

=item * Search CPAN

L<http://search.cpan.org/dist/Net-Twitter-Cabal/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Pedro Figueiredo, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

45; # End of Net::Twitter::Cabal::Config
