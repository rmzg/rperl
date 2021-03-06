#!/usr/bin/env perl

# [[[ PREPROCESSOR ]]]
# <<< EXECUTE_SUCCESS: 'have $bar = [ 21 ]' >>>
# <<< EXECUTE_SUCCESS: 'have $bar_length = 1' >>>
# <<< EXECUTE_SUCCESS: 'have $bar_shift = 21' >>>
# <<< EXECUTE_SUCCESS: 'have $bar = [ ]' >>>
# <<< EXECUTE_SUCCESS: 'have $bar_length = 0' >>>

# [[[ HEADER ]]]
use RPerl;
use strict;
use warnings;
our $VERSION = 0.001_000;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls)  # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(RequireInterpolationOfMetachars)  # USER DEFAULT 2: allow single-quoted control characters & sigils

# [[[ OPERATIONS ]]]
my integer_arrayref $bar = [];
my integer $bar_length = ( unshift @{$bar}, 21 );
print 'have $bar = ', integer_arrayref_to_string($bar), "\n";
print 'have $bar_length = ', $bar_length, "\n";

my integer $bar_shift = shift @{$bar};
$bar_length = scalar @{$bar};
print 'have $bar_shift = ', $bar_shift, "\n";
print 'have $bar = ', integer_arrayref_to_string($bar), "\n";
print 'have $bar_length = ', $bar_length, "\n";
