#!perl

use Test::Most;    # plan is down at bottom

use Term::TtyWrite;

dies_ok( sub { Term::TtyWrite->new }, "no args no dice" );

my $tty;

ok( $tty = Term::TtyWrite->new(__FILE__), "write access to known file" );
isa_ok( $tty, "Term::TtyWrite" );

# TODO actually testing this is going to be tricky given a) need for
# root and b) creating virtual terminals to poke at and so forth :/

plan tests => 3;
