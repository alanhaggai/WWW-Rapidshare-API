#!perl -T

use Test::More tests => 2;

BEGIN {
    use_ok( 'WWW::Rapidshare::API' );
    use_ok( 'WWW::Rapidshare::API' );
}

diag( "Testing WWW::Rapidshare::API $WWW::Rapidshare::API::VERSION, Perl $], $^X" );
