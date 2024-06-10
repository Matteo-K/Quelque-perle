#! /usr/bin/perl

use strict;
use warnings;

my $nom = "Jack";
print "Bonjour $nom\nenchante\n";
print 'Bonjour $nom\nenchante';

my $nom2 = "Basile";
my $concatenate = "$nom $nom2";


my $a = 3;
my $res = $a*$a;

print "\n$a * $a = $res";

my $s;
print "Bonsoir $s\n" if(defined($s));
$s = "Denis";
print "\nBonsoir $s\n" if(defined($s));

$a = int(rand(2));
print "$a\n";


sub round {
    my ($grid_ref, $player) = @_;  # capture la grille en tant que référence et la valeur du joueur
    # le reste du code reste inchangé
    print "$grid_ref\n";
    print "$player";
}

my @grid = (
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
);  # exemple de grille de morpion

my $player = 1;  # exemple de joueur

round(\@grid, $player);  # appel de la sous-routine avec une référence à la grille et la valeur du joueur