#!/usr/bin/perl

# [[[ HEADER ]]]
use strict;
use warnings;
use RPerl;
our $VERSION = 0.001_000;

# [[[ CRITICS ]]]
## no critic qw(ProhibitUselessNoCritic ProhibitMagicNumbers RequireCheckedSyscalls) # USER DEFAULT 1: allow numeric values & print operator
## no critic qw(ProhibitConstantPragma ProhibitMagicNumbers)  # USER DEFAULT 3: allow constants

use constant PI => 3.141_592_654;

# [[[ OPERATIONS ]]]
my number $radius = 12.5;
my number $circumference = 2 * PI() * $radius;

print 'Pi = ' . PI() . "\n";
print 'Radius = ' . $radius . "\n";
print 'Circumference = 2 * Pi * Radius = 2 * ' . PI() . ' * ' . $radius . ' = ' . $circumference . "\n";