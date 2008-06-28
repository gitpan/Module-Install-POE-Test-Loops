use inc::Module::Install;

name		'Module-Install-POE-Test-Loops';
perl_version	'5.005';
all_from	'lib/Module/Install/POE/Test/Loops.pm';


requires 'POE::Test::Loops'	=> '1.000';

test_requires 'Test::More' => '0';

tests('t/*.t');
author_tests('t/author');

auto_provides;

WriteAll;
