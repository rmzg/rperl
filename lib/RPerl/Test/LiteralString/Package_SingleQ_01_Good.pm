# [[[ HEADER ]]]
package RPerl::Test::LiteralString::Package_SingleQ_01_Good;
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_000;

# [[[ SUBROUTINES ]]]
our void $empty_sub = sub { q{foo123}; };

1;                  # end of package
