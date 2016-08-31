#!perl
#
# To use this test, open a terminal and obtain tty of such, then run
# something along the lines of:
#
#   sudo env AUTHOR_TEST_JMATES=/dev/ttyp4 PERL5LIB=$PERL5LIB prove -b t/10-author.t
#
# or as appropriate to obtain your local modules (if any) as well as
# this module; details will vary depending on perlbrew or other
# complications.

use Test::Most;
use Term::TtyWrite;

my $testcount = 1;

SKIP: {
    skip "not author", $testcount unless exists $ENV{AUTHOR_TEST_JMATES};
    my $tty;

    ok( $tty = Term::TtyWrite->new( $ENV{AUTHOR_TEST_JMATES} ),
        "user-supplied tty" );
    diag "PID $$\n";
    $tty->write("echo hi $$\n");
    $tty->write_delay( "echo slowly\n", 250 );
}

plan tests => $testcount;
