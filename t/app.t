#!perl -T

use strict;
use warnings;
use Test::More qw(no_plan);
use WWW::Rapidshare::API;

like( nextuploadserver(), qr/^rs\d+\.rapidshare\.com$/,
    'nextuploadserver() succeeded' );

like( getapicpu(), ( qr/^\d+$/, qr/^\d+$/ ), 'getapicpu() succeeded' );