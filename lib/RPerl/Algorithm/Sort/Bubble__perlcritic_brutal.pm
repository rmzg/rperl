package RPerl::Algorithm::Sort::Bubble__perlcritic_brutal__perltidy_pbp;

use strict;
use warnings;
use version; our $VERSION = qv('0.0.9');

#our @ISA = ('RPerl::Algorithm::Sort');
##our @ISA = ( 'RPerl::Algorithm::Sort', 'RPerl::Algorithm::Inefficient' );
use parent ( 'RPerl::Algorithm::Sort', 'RPerl::Algorithm::Inefficient' );
use RPerl::Algorithm::Sort;
use RPerl::Algorithm::Inefficient;

##our %properties = ( data => my integer__array_ref $KEY_data );
my %properties = ( data => my integer__array_ref $KEY_data );

# [object-oriented programming integererface]
# call out to sort data, return nothing
our void__method $sort = sub {
    ( my object $self) = @_;

# DEV NOTE: this is an in-place sorting algorithm, we don't actually need to set $self->{data} as it has not changed location
    $self->{data} = bubblesort( $self->{data} );
};

# Random note for later from mst:
#   This would warn BUT "no warnings 'illegalproto'" disables that
#   Now you can extract the prototype at runtime using 'perldoc -f prototype'
#   Key thing: whitespace in the prototype is lost so you'll be parsing 'integer__array_ref->integer__array_ref'
#   however it's otherwise preserved verbatim by the perl compiler and you can do what you like with it
#   Web::Simple uses this to provide 'sub (GET + /user/:id) { ... }' for web routing.
#   sub bubblesort(integer__array_ref -> integer__array_ref) {}
# end random note

# [procedural programming integererface]
# original algorithm: comparison-based and stable [O(n**2) average time, O(1) worst-case extra space]
# sort data, return sorted data
our integer__array_ref $bubblesort = sub {
    ( my integer__array_ref $data) = @_;
    my integer $is_sorted = 0;
##    my integer $i;
    my const_integer $data_length = scalar @{$data};
    my integer $swap;

#	print "in bubblesort(), have \$data_length = $data_length\n" if $RPerl::DEBUG;

# iterate through the length-n list up to n times (n * n == n**2), larger elements "bubble to the top" (end) of the list
    while ( not($is_sorted) ) {

#        print "in bubblesort(), top of WHILE loop\n" if $RPerl::DEBUG;
        $is_sorted = 1;
##        for ( $i = 0; $i < ( $data_length - 1 ); $i++ ) {
        for my integer $i ( 0 .. ( $data_length - 1 ) ) {

#            print "in bubblesort(), inside for() loop, have \$i = $i\n" if $RPerl::DEBUG;
#            print "in bubblesort(), inside for() loop, have \$data\n" . RPerl::DUMPER($data) . "\n" if $RPerl::DEBUG;

            # compare elements and swap if out-of-order, this is the core sort comparison
            if ( $data->[$i] > $data->[ ( $i + 1 ) ] ) {

#                print "in bubblesort(), inside for() loop, SWAPPED\n" if $RPerl::DEBUG;
                $is_sorted = 0;
                $swap      = $data->[$i];
                $data->[$i] = $data->[ ( $i + 1 ) ];
                $data->[ ( $i + 1 ) ] = $swap;
            }
        }
    }

# data is now sorted via top-level nested iteration [O(n**2) total time, O(1) total extra space]
# DEV NOTE: this is an in-place sorting algorithm, we don't actually need to return $data as it has not changed location, EXCEPT FOR IN C++ BECAUSE OF PACKING/UNPACKING!!!
    return $data;
};

# [[[ INHERITANCE TESTING ]]]
our void__method $inherited__Bubble = sub {
    ( my object $self, my string $person) = @_;
##    print "in Perl Bubble->inherited__Bubble(), have \$self = '$self' and \$person = '$person', FRIED\n";
    print "in Perl Bubble->inherited__Bubble(), have \$self = '$self' and \$person = '$person', FRIED\n" or croak;
};

#our void__method $inherited = sub { (my object $self, my string $person) = @_;  print "in Perl Bubble->inherited(), have \$self = '$self' and \$person = '$person', ILLOGICAL\n"; };
our string $uninherited__Bubble = sub {
    ( my string $person) = @_;
##    print "in Perl Bubble::uninherited__Bubble(), \$person = '$person', MITOCHONDRIAL\n";
    print "in Perl Bubble::uninherited__Bubble(), \$person = '$person', MITOCHONDRIAL\n" or croak;
##    return "Perl Bubble::uninherited__Bubble() RULES!";
    return 'Perl Bubble::uninherited__Bubble() RULES!';
};

#our string $uninherited = sub { (my string $person) = @_;  print "in Perl Bubble::uninherited(), \$person = '$person', TETRAHEDRON\n";  return "Perl Bubble::uninherited() ROCKS!"; };

1;
