#!/usr/bin/perl -w

use strict;

use Algorithm::Permute;
use File::Basename;
use List::Util 1.33 'any';
use Getopt::Std;

# Init Stuff    
#########################################################################

my %options = ();
my ( $verbose, $string, $string_len, $handle, $p );
my @chars;
my @res;
my @words;

sub usage {
    print "\n";
    print "Usage: " . basename( $0 ) . " [-vh] [-s string] [-d dictionary_file]\n";
    print "\tWill generate all permutations of string and print valid words (found in dictionary)\n";
    print "\t\t -h\t\thelp - this message\n";
    print "\t\t -v\t\tverbose - prints out all permutations\n";
    print "\t\t -s string\tstring with the chars to permutate\n";
    print "\t\t -d dictionary\tText file with one word per line which should contain all valid words in a given language\n";
    print "\n";
}

sub isword {
    my $s = $_[0]; # word to search

    return 1 if any { /\b$s\b/ } @words;
    return 0;
}

#########################################################################

getopts( "hvd:s:", \%options );

if ( !%options || $options{h} ) {
    usage();
    exit;
}

if ( !defined $options{s} || !defined $options{d} ) {
    usage();
    exit;
}

if ( defined $options{v} ) {
    $verbose = 1;
}
else {
    undef $verbose;
}

# Get the chars to permutate
$string     = $options{s};
$string_len = length( $string );

@chars = split( "", lc( $string ));

# Get the dictionary
open ( $handle, $options{d} ) || die "Error opening $options{d} $!";
chomp( @words = <$handle> );
$_ = lc for @words;
close $handle;

# Permute and lookup
#########################################################################

$p = new Algorithm::Permute( [@chars] );
while ( @res = $p->next ) {
    my $s = join( "", @res );
    if ( isword( $s )) {
        print "[ $s ]\n";
    }
    else {
        print "==> $s\n" if ( $verbose );
    }
}

print "---\n";
