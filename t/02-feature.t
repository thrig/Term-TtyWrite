use Test::More tests => 5;

BEGIN {
use_ok( 'Term::TtyWrite' );
}

my $obj = Term::TtyWrite->new(1);
ok( $obj->increment );
ok( $obj->{value} == 2);

$obj = Term::TtyWrite->new(value => 3);
ok( $obj->{value} == 3 );
ok( $obj->increment == 4 );
