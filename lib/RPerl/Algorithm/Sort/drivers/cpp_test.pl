#!/usr/bin/perl
use strict;  use warnings;

BEGIN { unshift(@INC, ('/frobnicate', '/tmp/CPAN', 'befunge')); }
use MyConfig;

#package main;
#BEGIN { print "[[[ BEGIN 'use Inline' STAGE for 'RPerl/Algorithm/Sort/Bubble.cpp' ]]]\n"x3; }

#use Inline::Filters;
#use Inline Config => FILTERS => [Preprocess];

#use Inline CPP => <<'END';
use Inline CPP => <<'END', FILTERS => 'Preprocess';
////use strict;  use warnings;
using std::cout;  using std::endl;

#include "/tmp/RPerl-latest/lib/RPerl/HelperFunctions.h"
#include "/tmp/RPerl-latest/lib/RPerl/Algorithm/Sort/Bubble.h"

////# [object-oriented programming interface]
////# call out to sort data, return nothing
////our void__method $sort = sub {(my object $self) = @_;
//void Bubble::sort()
void CPP__RPerl__Algorithm__Sort__Bubble::sort()
////;
{
	if (RPerl__DEBUG2) { printf("in sort(), top of subroutine, have pre-DUMPER SV_REFERENCE_COUNT(this->data) = %lu\n", SV_REFERENCE_COUNT(this->data));  printf("in sort(), top of subroutine, have this->data = %s", RPerl_DUMPER__perl_from_c(this->data));  printf("in sort(), top of subroutine, have post-DUMPER SV_REFERENCE_COUNT(this->data) = %lu\n\n", SV_REFERENCE_COUNT(this->data));  }

////	$self->{data} = bubblesort($self->{data});
	this->data = bubblesort(this->data);

	if (RPerl__DEBUG2) { printf("in sort(), bottom of subroutine, have pre-SvREFCNT_dec pre-DUMPER SV_REFERENCE_COUNT(this->data) = %lu\n", SV_REFERENCE_COUNT(this->data));  printf("in sort(), bottom of subroutine, have pre-SvREFCNT_dec this->data = %s", RPerl_DUMPER__perl_from_c(this->data));  printf("in sort(), bottom of subroutine, have pre-SvREFCNT_dec post-DUMPER SV_REFERENCE_COUNT(this->data) = %lu\n\n", SV_REFERENCE_COUNT(this->data));  }
	SvREFCNT_dec(this->data);
	if (RPerl__DEBUG2) { printf("in sort(), bottom of subroutine, have post-SvREFCNT_dec pre-DUMPER SV_REFERENCE_COUNT(this->data) = %lu\n", SV_REFERENCE_COUNT(this->data));  printf("in sort(), bottom of subroutine, have post-SvREFCNT_dec this->data = %s", RPerl_DUMPER__perl_from_c(this->data));  printf("in sort(), bottom of subroutine, have post-SvREFCNT_dec post-DUMPER SV_REFERENCE_COUNT(this->data) = %lu\n\n", SV_REFERENCE_COUNT(this->data));  }
//	if (RPerl__DEBUG2) { printf("in sort(), bottom of subroutine, have pre-DUMPER SV_REFERENCE_COUNT(this->data) = %lu\n", SV_REFERENCE_COUNT(this->data));  printf("in sort(), bottom of subroutine, have this->data = %s", RPerl_DUMPER__perl_from_c(this->data));  printf("in sort(), bottom of subroutine, post-DUMPER SV_REFERENCE_COUNT(this->data) = %lu\n\n", SV_REFERENCE_COUNT(this->data));  }
////};
}

////# [procedural programming interface]
////# original algorithm: comparison-based and stable [O(n**2) average time, O(1) worst-case extra space]
////# sort data, return sorted data
////our scalar_array_ref $bubblesort = sub {(my scalar_array_ref $data) = @_;
SV *bubblesort(SV *data)  // DEV NOTE: properly creates local-to-function SV* data here, does not get confused with this->data object property, even though they share a name
////;
{
	RPerl_object_property_init(data); // NEED ANSWER: why do we need to do property init?
	SvREFCNT_inc(data);

	if (RPerl__DEBUG3) { printf("in bubblesort(), top of subroutine, have pre-DUMPER SV_REFERENCE_COUNT(data) = %lu\n", SV_REFERENCE_COUNT(data));  printf("in bubblesort(), top of subroutine, have data = %s", RPerl_DUMPER__perl_from_c(data));  printf("in bubblesort(), top of subroutine, have post-DUMPER SV_REFERENCE_COUNT(data) = %lu\n\n", SV_REFERENCE_COUNT(data)); }
////	my int $is_sorted = 0;
	int is_sorted = 0;
////	my int $i;
	int i;
////	my const_int $data_length = scalar(@{$data});
//	const int data_length = av_len((AV*) SvRV(data)) + 1;  // DE-OPTIMIZE, SHORT-HAND
	AV* data_av = (AV*) SvRV(data);  // OPTIMIZE, LONG-HAND: data dereferenced to data_av more than once, declare data_av and re-use, MUST REFRESH data_av for every assignment directly to data (none in this algorithm)
	const int data_length = av_len(data_av) + 1;  // OPTIMIZE, LONG-HAND: use data_av
	SV *data_i = newSV(0);  // OPTIMIZE, LONG-HAND: data element i accessed more than once, declare data_i and re-use;  all new SV*'s given initial undef newSV(0) value to avoid printf() errors during debugging
	SV *data_i_plus_1 = newSV(0);  // OPTIMIZE, LONG-HAND

////	my scalar $swap;
	SV *swap = newSV(0);

	if (RPerl__DEBUG2) { printf("in bubblesort(), after variable init, have pre-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n", SV_REFERENCE_COUNT(data_i));  printf("in bubblesort(), after variable init, have data_i = %s", RPerl_DUMPER__perl_from_c(data_i));  printf("in bubblesort(), after variable init, have post-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n\n", SV_REFERENCE_COUNT(data_i)); }
	if (RPerl__DEBUG2) { printf("in bubblesort(), after variable init, have pre-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n", SV_REFERENCE_COUNT(data_i_plus_1));  printf("in bubblesort(), after variable init, have data_i_plus_1 = %s", RPerl_DUMPER__perl_from_c(data_i_plus_1));  printf("in bubblesort(), after variable init, have post-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n\n", SV_REFERENCE_COUNT(data_i_plus_1)); }
	if (RPerl__DEBUG2) { printf("in bubblesort(), after variable init, have pre-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n", SV_REFERENCE_COUNT(swap));  printf("in bubblesort(), after variable init, have swap = %s", RPerl_DUMPER__perl_from_c(swap));  printf("in bubblesort(), after variable init, have post-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n\n", SV_REFERENCE_COUNT(swap)); }

////#	print "in bubblesort(), have \$data_length = $data_length\n" if $RPerl::DEBUG;
	 if (RPerl__DEBUG2) { printf("in bubblesort(), after variable init, have data_length = %d\n", data_length); }

////	# iterate through the length-n list up to n times (n * n == n**2), larger elements "bubble to the top" (end) of the list
////	while (not($is_sorted))
	while (not(is_sorted))
////	{
	{
////#		print "in bubblesort(), top of while loop\n" if $RPerl::DEBUG;
		if (RPerl__DEBUG2) { printf("in bubblesort(), top of while() loop\n"); }
		if (RPerl__DEBUG3) { printf("in bubblesort(), top of while() loop, have pre-DUMPER SV_REFERENCE_COUNT(data) = %lu\n", SV_REFERENCE_COUNT(data));  printf("in bubblesort(), top of while() loop, have data = %s", RPerl_DUMPER__perl_from_c(data));  printf("in bubblesort(), top of while() loop, have post-DUMPER SV_REFERENCE_COUNT(data) = %lu\n\n", SV_REFERENCE_COUNT(data)); }
		if (RPerl__DEBUG) { printf("in bubblesort(), top of while() loop, have pre-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n", SV_REFERENCE_COUNT(data_i));  printf("in bubblesort(), top of while() loop, have data_i = %s", RPerl_DUMPER__perl_from_c(data_i));  printf("in bubblesort(), top of while() loop, have post-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n\n", SV_REFERENCE_COUNT(data_i)); }
		if (RPerl__DEBUG) { printf("in bubblesort(), top of while() loop, have pre-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n", SV_REFERENCE_COUNT(data_i_plus_1));  printf("in bubblesort(), top of while() loop, have data_i_plus_1 = %s", RPerl_DUMPER__perl_from_c(data_i_plus_1));  printf("in bubblesort(), top of while() loop, have post-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n\n", SV_REFERENCE_COUNT(data_i_plus_1)); }
		if (RPerl__DEBUG) { printf("in bubblesort(), top of while() loop, have pre-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n", SV_REFERENCE_COUNT(swap));  printf("in bubblesort(), top of while() loop, have swap = %s", RPerl_DUMPER__perl_from_c(swap));  printf("in bubblesort(), top of while() loop, have post-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n\n", SV_REFERENCE_COUNT(swap)); }

////		$is_sorted = 1;
		is_sorted = 1;
////		for ($i = 0; $i < ($data_length - 1); $i++)
		for (i = 0; i < (data_length - 1); i++)
////		{
		{
////#			print "in bubblesort(), inside for() loop, have \$i = $i\n" if $RPerl::DEBUG;
			if (RPerl__DEBUG2) { printf("in bubblesort(), top of for() loop, have i = %d\n", i); }
////#			print "in bubblesort(), inside for() loop, have \$data\n" . RPerl::DUMPER($data) . "\n" if $RPerl::DEBUG;
			if (RPerl__DEBUG3) { printf("in bubblesort(), top of for() loop, have pre-DUMPER SV_REFERENCE_COUNT(data) = %lu\n", SV_REFERENCE_COUNT(data));  printf("in bubblesort(), top of for() loop, have data = %s", RPerl_DUMPER__perl_from_c(data));  printf("in bubblesort(), top of for() loop, have post-DUMPER SV_REFERENCE_COUNT(data) = %lu\n\n", SV_REFERENCE_COUNT(data)); }
			if (RPerl__DEBUG) { printf("in bubblesort(), top of for() loop, have pre-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n", SV_REFERENCE_COUNT(data_i));  printf("in bubblesort(), top of for() loop, have data_i = %s", RPerl_DUMPER__perl_from_c(data_i));  printf("in bubblesort(), top of for() loop, have post-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n\n", SV_REFERENCE_COUNT(data_i)); }
			if (RPerl__DEBUG) { printf("in bubblesort(), top of for() loop, have pre-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n", SV_REFERENCE_COUNT(data_i_plus_1));  printf("in bubblesort(), top of for() loop, have data_i_plus_1 = %s", RPerl_DUMPER__perl_from_c(data_i_plus_1));  printf("in bubblesort(), top of for() loop, have post-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n\n", SV_REFERENCE_COUNT(data_i_plus_1)); }
			if (RPerl__DEBUG) { printf("in bubblesort(), top of for() loop, have pre-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n", SV_REFERENCE_COUNT(swap));  printf("in bubblesort(), top of for() loop, have swap = %s", RPerl_DUMPER__perl_from_c(swap));  printf("in bubblesort(), top of for() loop, have post-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n\n", SV_REFERENCE_COUNT(swap)); }

////			# compare elements and swap if out-of-order, this is the core sort comparison
////			if ($data->[$i] > $data->[($i + 1)])
//			if (SvNV(AV_ELEMENT((AV*) SvRV(data), i)) > SvNV(AV_ELEMENT((AV*) SvRV(data), (i + 1))))  // DE-OPTIMIZE, SHORT-HAND
			data_i = AV_ELEMENT(data_av, i);  // OPTIMIZE, LONG-HAND: use data_i and data_av
			data_i_plus_1 = AV_ELEMENT(data_av, (i + 1));  // OPTIMIZE, LONG-HAND: use data_i_plus_1 and data_av
			// NEED ANSWER: assuming numeric value and using C++ numeric comparator, is this appropriate?
			if (SvNV(data_i) > SvNV(data_i_plus_1))  // OPTIMIZE, LONG-HAND: use data_i and data_i_plus_1
////			{
			{
////#				print "in bubblesort(), inside for() loop, SWAPPED\n" if $RPerl::DEBUG;
				if (RPerl__DEBUG2) { printf("in bubblesort(), inside for() loop, SWAPPED\n"); }
////				$is_sorted = 0;
				is_sorted = 0;
////				$swap = $data->[$i];
//				swap = AV_ELEMENT((AV*) SvRV(data), i);  // DE-OPTIMIZE, SHORT-HAND
				data_i = AV_ELEMENT(data_av, i);  // OPTIMIZE, LONG-HAND: use data_i and data_av
				swap = data_i;  // OPTIMIZE, LONG-HAND: use data_i
////				$data->[$i] = $data->[($i + 1)];
//				av_store((AV*) SvRV(data), i, SvREFCNT_inc(AV_ELEMENT((AV*) SvRV(data), (i + 1))));  // DE-OPTIMIZE, SHORT-HAND
				data_i_plus_1 = AV_ELEMENT(data_av, (i + 1));  // OPTIMIZE, LONG-HAND: use data_i_plus_1 and data_av
				av_store(data_av, i, SvREFCNT_inc(data_i_plus_1));  // OPTIMIZE, LONG-HAND: use data_av and data_i_plus_1
////				$data->[($i + 1)] = $swap;
//				av_store((AV*) SvRV(data), (i + 1), SvREFCNT_inc(swap));  // DE-OPTIMIZE, SHORT-HAND
				av_store(data_av, (i + 1), SvREFCNT_inc(swap));  // OPTIMIZE, LONG-HAND: use data_av
////			}
			}
			if (RPerl__DEBUG3) { printf("in bubblesort(), bottom of for() loop, have pre-DUMPER SV_REFERENCE_COUNT(data) = %lu\n", SV_REFERENCE_COUNT(data));  printf("in bubblesort(), bottom of for() loop, have data = %s", RPerl_DUMPER__perl_from_c(data));  printf("in bubblesort(), bottom of for() loop, have post-DUMPER SV_REFERENCE_COUNT(data) = %lu\n\n", SV_REFERENCE_COUNT(data)); }
			if (RPerl__DEBUG) { printf("in bubblesort(), bottom of for() loop, have pre-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n", SV_REFERENCE_COUNT(data_i));  printf("in bubblesort(), bottom of for() loop, have data_i = %s", RPerl_DUMPER__perl_from_c(data_i));  printf("in bubblesort(), bottom of for() loop, have post-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n\n", SV_REFERENCE_COUNT(data_i)); }
			if (RPerl__DEBUG) { printf("in bubblesort(), bottom of for() loop, have pre-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n", SV_REFERENCE_COUNT(data_i_plus_1));  printf("in bubblesort(), bottom of for() loop, have data_i_plus_1 = %s", RPerl_DUMPER__perl_from_c(data_i_plus_1));  printf("in bubblesort(), bottom of for() loop, have post-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n\n", SV_REFERENCE_COUNT(data_i_plus_1)); }
			if (RPerl__DEBUG) { printf("in bubblesort(), bottom of for() loop, have pre-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n", SV_REFERENCE_COUNT(swap));  printf("in bubblesort(), bottom of for() loop, have swap = %s", RPerl_DUMPER__perl_from_c(swap));  printf("in bubblesort(), bottom of for() loop, have post-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n\n", SV_REFERENCE_COUNT(swap)); }
////		}
		}
		if (RPerl__DEBUG3) { printf("in bubblesort(), bottom of while() loop, have pre-DUMPER SV_REFERENCE_COUNT(data) = %lu\n", SV_REFERENCE_COUNT(data));  printf("in bubblesort(), bottom of while() loop, have data = %s", RPerl_DUMPER__perl_from_c(data));  printf("in bubblesort(), bottom of while() loop, have post-DUMPER SV_REFERENCE_COUNT(data) = %lu\n\n", SV_REFERENCE_COUNT(data)); }
		if (RPerl__DEBUG) { printf("in bubblesort(), bottom of while() loop, have pre-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n", SV_REFERENCE_COUNT(data_i));  printf("in bubblesort(), bottom of while() loop, have data_i = %s", RPerl_DUMPER__perl_from_c(data_i));  printf("in bubblesort(), bottom of while() loop, have post-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n\n", SV_REFERENCE_COUNT(data_i)); }
		if (RPerl__DEBUG) { printf("in bubblesort(), bottom of while() loop, have pre-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n", SV_REFERENCE_COUNT(data_i_plus_1));  printf("in bubblesort(), bottom of while() loop, have data_i_plus_1 = %s", RPerl_DUMPER__perl_from_c(data_i_plus_1));  printf("in bubblesort(), bottom of while() loop, have post-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n\n", SV_REFERENCE_COUNT(data_i_plus_1)); }
		if (RPerl__DEBUG) { printf("in bubblesort(), bottom of while() loop, have pre-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n", SV_REFERENCE_COUNT(swap));  printf("in bubblesort(), bottom of while() loop, have swap = %s", RPerl_DUMPER__perl_from_c(swap));  printf("in bubblesort(), bottom of while() loop, have post-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n\n", SV_REFERENCE_COUNT(swap)); }
////	}
	}

//	SvREFCNT_inc(data);
	if (RPerl__DEBUG3) { printf("in bubblesort(), bottom of subroutine, have pre-DUMPER SV_REFERENCE_COUNT(data) = %lu\n", SV_REFERENCE_COUNT(data));  printf("in bubblesort(), bottom of subroutine, have data = %s", RPerl_DUMPER__perl_from_c(data));  printf("in bubblesort(), bottom of subroutine, have post-DUMPER SV_REFERENCE_COUNT(data) = %lu\n\n", SV_REFERENCE_COUNT(data)); }
	if (RPerl__DEBUG) { printf("in bubblesort(), bottom of subroutine, have pre-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n", SV_REFERENCE_COUNT(data_i));  printf("in bubblesort(), bottom of subroutine, have data_i = %s", RPerl_DUMPER__perl_from_c(data_i));  printf("in bubblesort(), bottom of subroutine, have post-DUMPER SV_REFERENCE_COUNT(data_i) = %lu\n\n", SV_REFERENCE_COUNT(data_i)); }
	if (RPerl__DEBUG) { printf("in bubblesort(), bottom of subroutine, have pre-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n", SV_REFERENCE_COUNT(data_i_plus_1));  printf("in bubblesort(), bottom of subroutine, have data_i_plus_1 = %s", RPerl_DUMPER__perl_from_c(data_i_plus_1));  printf("in bubblesort(), bottom of subroutine, have post-DUMPER SV_REFERENCE_COUNT(data_i_plus_1) = %lu\n\n", SV_REFERENCE_COUNT(data_i_plus_1)); }
	if (RPerl__DEBUG) { printf("in bubblesort(), bottom of subroutine, have pre-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n", SV_REFERENCE_COUNT(swap));  printf("in bubblesort(), bottom of subroutine, have swap = %s", RPerl_DUMPER__perl_from_c(swap));  printf("in bubblesort(), bottom of subroutine, have post-DUMPER SV_REFERENCE_COUNT(swap) = %lu\n\n", SV_REFERENCE_COUNT(swap)); }

////	# data is now sorted via top-level nested iteration [O(n**2) total time, O(1) total extra space]
////	return $data;
//	SvREFCNT_dec(data);
	return data;
////};
}

END

print "[[[ END 'use Inline' STAGE for 'RPerl/Algorithm/Sort/Bubble.cpp' ]]]\n"x3;
1;