use inc::Module::Install;

name     'Net-Twitter-Cabal';
all_from 'lib/Net/Twitter/Cabal.pm';
author   'Pedro Figueiredo <me@pedrofigueiredo.org>';
license  'perl';

build_requires 'Test::More';
#build_requires 'Test::MockObject';

requires 'Class::Accessor::Fast';
requires 'Config::Any';
requires 'DateTime';
requires 'Log::Log4perl';

requires 'AnyEvent::XMPP';
requires 'Net::Twitter' => '2.0';

auto_install;

WriteAll;

