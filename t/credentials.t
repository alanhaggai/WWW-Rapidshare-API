#!perl -T

use strict;
use warnings;
use Test::More qw(no_plan);
use Test::Exception;
use WWW::Rapidshare::API;

throws_ok(
    sub {
        credentials(
            username => 'not_a_valid_user',
            password => 'not_at_all_valid',
            cookie   => 'not_valid',
        );
    },
    qr/^Incorrect parametres/,
    'credentials() croaked, as expected, with incorrect parametres'
);
throws_ok(
    sub {
        credentials(
            {
                username => undef,
                password => 'not_at_all_valid',
                cookie   => undef,
            }
        );
    },
    qr/^Incorrect parametres/,
'credentials() croaked, as expected, when both username and cookie are not provided'
);
lives_ok(
    sub {
        credentials(
            {
                username => 'not_a_valid_user',
                password => 'not_at_all_valid',
                cookie =>
'2AA928EE1DBA4AE093D872E578CEC9B106280FD1429D4A8C8FB72AE6ACEDC9C2A086C285F502F0FEE77567F6C9051BD1'
            }
        );
    },
    'credentials() succeeded'
);
my %credentials = storedcredentials();
is( $credentials{username}, 'not_a_valid_user',
    'storedcredentials() returned username' );
is( $credentials{password}, 'not_at_all_valid',
    'storedcredentials() returned password' );
