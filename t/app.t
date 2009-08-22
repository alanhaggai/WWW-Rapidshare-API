#!perl -T

use strict;
use warnings;
use Test::More qw(no_plan);
use WWW::Rapidshare::API;

like( nextuploadserver(), qr/\d+/, 'nextuploadserver() succeeded' );
