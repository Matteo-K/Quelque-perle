#! /usr/bin/perl

use strict;
use warnings;

my $v = "velo RAPIDE";
my $w = "1+1=2";

if ($v =~ m/velo/){
    print "la variable \$v contient velo\n";
}

if ($v =~ m/[A-Z]$/){
    print "la variable \$v finit par une majuscule\n";
}

if ($w =~ m/(\d)[+\-\*\/]\1/){
    print "la variable \$w contient deux chiffres identique separe par une operation mathematique\n";
}

my ($prem,$deux) = ( $v =~ m/^(.)(.)/ );
print "premier $prem, deuxieme $deux\n";

($prem,$deux) = ( $v =~ m/^(\w+)\s+(\w+)/ );
print "premier $prem, deuxieme $deux\n";

my ($dern) = ($v =~ m/(\w)$/);
print "dernier : $dern\n";