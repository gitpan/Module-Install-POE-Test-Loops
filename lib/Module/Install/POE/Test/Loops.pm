package Module::Install::POE::Test::Loops;

use 5.005;
use strict;
use Module::Install::Base;
use POE::Test::Loops;
use File::Spec;
use Carp ();

=head1 NAME

Module::Install::POE::Test::Loops - Install tests for L<POE::Loop>s

=head1 VERSION

0.01

=cut

use vars qw{$VERSION $ISCORE @ISA};
BEGIN {
  $VERSION = '0.01';
  $ISCORE  = 1;
  @ISA     = qw{Module::Install::Base};
}

=head1 COMMANDS

This plugin adds the following Module::Install commands:

=head2 gen_loop_tests

  gen_loop_tests('t', qw(Glib));

generates tests under the directory F<./t> for the Glib loop.

=cut

sub gen_loop_tests {
  my ($self, @args) = @_;
  my $dir = shift @args;
  _gen_loop_tests($self, $dir, \@args);
}

sub _gen_loop_tests {
  my ($self, $dir, $loops) = @_;
  #return unless $Module::Install::AUTHOR;

  my @tests = $self->tests ? (split / /, $self->tests) : 't/*.t';

  Carp::confess "no dirs given to author_tests"
    unless @$loops;

  POE::Test::Loops::generate($dir, $loops);
  
  $self->tests( join ' ', @tests, map {
				File::Spec->catfile("$dir/", lc($_), "*.t");
				      } sort @$loops
	      );
}

1;

=head1 BUGS

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>. I will be notified, and then you'll automatically be
notified of progress on your bug as I make changes.

=head1 AUTHOR

Martijn van Beers  <martijn@cpan.org>

=head1 LICENCE gpl

This software is Copyright (c) 2008 by Martijn van Beers.

This is free software, licensed under the GNU General
Public License, Version 2 or higher. See the LICENSE file for details.
