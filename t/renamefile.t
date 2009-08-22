#!perl -T

use strict;
use warnings;
use Test::More qw(no_plan);
use Test::Exception;
use WWW::Rapidshare::API;

throws_ok(
    sub { renamefile( fileid => 1, killcode => 1, newname => 'new.file' ) },
    qr/^Incorrect parametres/,
    'renamefile() croaked, as expected, with incorrect parametres'
);
throws_ok(
    sub { renamefile( filid => 1, kilcode => 1, nename => 'new.file' ) },
    qr/^Incorrect parametres/,
    'renamefile() croaked, as expected, with incorrect parametres'
);
like(
    renamefile( { fileid => 1, killcode => 1, newname => 'new.file' } ),
    qr/^ERROR:/,
'renamefile() returned error statement while trying with invalid fileid and killcode'
);
like(
    renamefile( { fileid => 1, killcode => 1, newname => '' } ),
    qr/^ERROR:/,
'renamefile() returned error statement while trying with invalid fileid, killcode and newname'
);