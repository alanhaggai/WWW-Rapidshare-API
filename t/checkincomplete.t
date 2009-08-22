#!perl -T

use strict;
use warnings;
use Test::More qw(no_plan);
use Test::Exception;
use WWW::Rapidshare::API;

throws_ok(
    sub { checkincomplete( fileid => 1, killcode => 1 ) },
    qr/^Incorrect parametres/,
    'checkincomplete() croaked, as expected, with incorrect parametres'
);
throws_ok(
    sub { checkincomplete( filid => 1, kilcode => 1 ) },
    qr/^Incorrect parametres/,
    'checkincomplete() croaked, as expected, with incorrect parametres'
);
like(
    checkincomplete( { fileid => 1, killcode => 1 } ),
    qr/^ERROR:/,
'checkincomplete() returned error statement while trying with invalid fileid and killcode'
);