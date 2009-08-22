package WWW::Rapidshare::API;

use warnings;
use strict;
use base 'Exporter';
use LWP::UserAgent;
use Carp;

=head1 NAME

WWW::Rapidshare::API - The great new WWW::Rapidshare::API!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';
our @EXPORT  = qw( nextuploadserver getapicpu checkincomplete );

my $api_url = 'http://api.rapidshare.com/cgi-bin/rsapi.cgi?sub=';

my $ua = LWP::UserAgent->new();
$ua->env_proxy();
$ua->agent('WWW::Rapidshare::API');

=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WWW::Rapidshare::API;

    my $foo = WWW::Rapidshare::API->new();
    ...

=head1 EXPORT

=head1 FUNCTIONS

=head2 nextuploadserver

=cut

sub nextuploadserver {
    my $response = $ua->get( $api_url . 'nextuploadserver_v1' );
    my $server   = $response->content();
    return "rs$server.rapidshare.com";
}

sub getapicpu {
    my $response = $ua->get( $api_url . 'getapicpu_v1' );
    my ( $current_points, $points_before_getting_blocked ) = split /,/,
      $response->content();
    return ( $current_points, $points_before_getting_blocked );
}

sub checkincomplete {
    my $error =
"Incorrect parametres.\nCorrect usage: checkincomplete( { fileid => \\d+, killcode => \\d+ } )";
    croak $error
      if ref( $_[0] ) ne 'HASH';
    my %parametres = %{ $_[0] };
    if ( !exists $parametres{fileid} || !exists $parametres{killcode} ) {
        croak $error;
    }

    my $response = $ua->get(
"${api_url}checkincomplete_v1&fileid=${parametres{fileid}}&killcode=${parametres{killcode}}"
    );
    return $response->content();
}

=head1 AUTHOR

Alan Haggai Alavi, C<< <alanhaggai at alanhaggai.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-www-rapidshare-api at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Rapidshare-API>.  I will be
notified, and then you'll automatically be notified of progress on your bug as I
make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Rapidshare::API

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-Rapidshare-API>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-Rapidshare-API>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-Rapidshare-API>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-Rapidshare-API/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Alan Haggai Alavi.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of WWW::Rapidshare::API
