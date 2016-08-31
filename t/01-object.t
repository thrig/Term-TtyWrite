
use Test::More tests => 10;

BEGIN {
use_ok( 'Term::TtyWrite' );
}

my $obj;

ok( $obj = Term::TtyWrite->new(), "no initializer");
isa_ok($obj,"Term::TtyWrite");

ok( $obj = Term::TtyWrite->new(1), "initial numeric value");
ok($obj->{value} == 1, "implicit initializer");

ok( $obj = Term::TtyWrite->new("fish"), "initial string value");
ok($obj->{value} eq "fish", "implicit initializer");

ok( $obj = Term::TtyWrite->new(color => "red", flavor => "sour"), 
	"hash as initializer");
ok( $obj->{color} eq "red", "first hash key");
ok( $obj->{flavor} eq "sour", "first hash key");
