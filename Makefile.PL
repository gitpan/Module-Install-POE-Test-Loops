use inc::Module::Install;

name		'Module-Install-POE-Test-Loops';
all_from	'lib/Module/Install/POE/Test/Loops.pm';


requires 'POE::Test::Loops'	=> '1.001';

test_requires 'Test::More' => '0';

tests('t/*.t');
author_tests('t/author');

auto_provides;

WriteAll;
