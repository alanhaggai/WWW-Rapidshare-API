use inc::Module::Install;

name     'WWW-Rapidshare-API';
all_from 'lib/WWW/Rapidshare/API.pm';
author   q{Alan Haggai Alavi <alanhaggai@alanhaggai.org>};
license  'perl';

build_requires 'Test::More';
build_requires 'Test::Exception';
requires 'LWP::UserAgent';

auto_install;

WriteAll;

