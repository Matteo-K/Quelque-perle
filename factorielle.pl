#!/bin/perl

use warnings;
use stable;

sub factoriel {
    my $value = shift @_;
    return 1 if($value == 1 || $ value == 0);
    return $value * factoriel($value-1);
}

sub Crible {
   my ($n) = @_;

   # Liste initiale :
   my @nombres = (2..$n);
   # Liste des nombres premiers trouvés :
   my @premiers = ();

   # Tant qu'il y a des éléments (un tableau
   # en contexte booléen vaut faux s'il est vide) :
   while( @nombres ) {

      # On extrait le premier nombre
      my $prem = shift @nombres;

      # On indique qu'il est premier
      push @premiers, $prem;

      # On supprime ses multiples
      @nombres = grep { ( $_ % $prem )!=0 } @nombres;
   }

   # On renvoie la liste des nombres premiers
   return @premiers;
}

print factoriel(5);
print Crible(100);