# Momento - Perl
## Fonction de perl

- [Fonction de base](#fonction-de-base)
- [Non-initialisé](#valeur-non-initialisé)
- [Math](#math)
- [Manipulation de chaine](#manipulation-des-chaînes)
- [Manipulation de tableau](#manipulation-de-tableau)
- [Table de Hachage](#hachage)
- [Manipulation de fichier](#manipulation-de-fichier)
- [Modules](#module)
- [Autre](#autre)

### Fonction de base

**printf**

    printf( forme : str, valeur );

écris un scalaire dans une forme spécifique donnée

exemple : printf("%4d", 45);

---

**getc**

    getc(<STDIN>)

permet l'entrer d'un caractère

---

**exit**

    exit(mod_sortie)

met fin au programme

- 0 : sortie normal du programme
- 1 : sortie erreur du programme

---

**die**

    die message;

La fonction die permet d'arrêter le programme et d'afficher un message d'erreur

---

**warn**

    warn message;

permet d'afficher un message d'avertissement et n'arrête pas le programme

### Valeur non-initialisé

**undef**

    $x = undef / undef($scalaire)

non initialise le scalaire

---

**defined**

    defined($scalaire)

vérifie si la valeur est initialisé
- True si initialisé
- False sinon

### Math

**sin**

    sin($scalaire)

calcul le sinus du scalaire

---

**cos**

    cos($scalaire)

calcul le cosinus du scalaire

---

**exp**

    exp($scalaire)

calcul e puissance le scalaire

---

**log**

    log($scalaire)

calcul le logarithme du scalaire

---

**sqrt** 

    sqrt($scalaire)

calcul la racine du scalaire

---

**abs**

    abs($scalaire)

calcul la valeur absolue du scalaire

---

**ord**

    ord($character)

obtient la valeur numérique en ASCII d'un caractère . A -> 65

---

**chr**

    chr($numver)

obtient le carctère en ASCII d'une valeur numérique. 65 -> A

### Manipulation des chaînes

**lenght**

    lenght($scalaire)

renvoie la longueur de la chaine

---

**chop**

    chop($scalaire)

supprime le dernier caractère de la chaine et est ainsi renvoyer par la fonction

---

**chomp** 

    chomp($scalaire)

supprime le dernier caractère d'une chaine s'il s'agit du dernier élément de la ligne de fin de ligne (\n,...)

---

**reverse**

    reverse($scalaire)

inverse l'ordre de la chaine / liste

exemple : reverse("bonjour\n") donne "\nruojnob"

---

**substr**

    substr($scalaire,$offset,$length)

renvoie la sous-chaine entre les deux indices

exemple : substr("bonjour",1,2) vaut on

elle peut être une lvalue c'est à dire left-value. elle peut insérer une valeur.

exemple : substr("salut toi",5,1) = "ation à " vaut "salutation à toi"

---

**index**

    index($chaîne,$sousChaîne,$position)

recherche l'indice de la première occurence de la sous-chaine dans la chaine. La position indique l'indice du début de la recherche

---

**rindex**

    rindex($chaîne,$sousChaîne,$position)

effectue la fonction index mais en partant de la fin

### Manipulation de tableau

**scalar**

    scalar(@array) / scalar @array

Force l'évaluation en contexte scalaire pour obtenir la taille du tableau

---

**exists**

    exists($tab[$indice])

Vérifie si l'élément du tableau existe. Par exemple, elle vérifie si $tab[100] existe
- True si l'élément existe
- False sinon

---

**unshift**

    unshift(@tab,$valeur,...)

ajoute les valeurs entrer dans la fonction à gauche de la liste

---

**shift**

    shift(@tab)
    shift @tab

retire le premier élément à gauche et retourne le scalaire

---

**push**

    push(@tab,$valeur,...)

ajoute les valeurs entrer dans la fonction à droite de la liste

---

**pop**

    pop(@tab)

retire le premier élément à droite et retourne le scalaire

---

**join**

    join(scalaire,@liste)

renvoie une chaine de caractère avec les éléments séparer par le scalaire

---

**split**

    split(/séparateur/,chaine)

renvoie les scalaires de la chaine séparer par le séparateur

---

**sort**

    sort( {comparaison} liste1 )

tri la liste en paramètre, tout au long du tri, le bloc d'instructions sera évalué pour comparer deux valeurs de la liste 

    sort( {$a <=> $b} @t )

    sort( @t )

Le bloc doit être composé d'une expression dont la valeur est :
- négative, si $a doit être avant $b dans la liste résultat ;

- positive, si $b doit être avant $a ;

- nulle, s'ils sont équivalents.

---

**grep**

    grep {sélection} @liste

renvoie une liste d'éléments qui correspond au critére de sélection. Chacune des valeurs sera localement affectée à la variable spéciale $_ sur laquelle les tests devront donc être effectués

exemple : 
- grep { $_<0 } @liste : renvoie une liste de scalaire dont la valeur est positif
- grep { fonction($_) } @t; doit renvoyer vrai ou faux selon que l'élément

Avec les expressions régulières :

grep(/expression/,@liste)

ex : grep( /^aa/, @t ) : renvoie les éléments qui commencent pas aa

---

**map**

    map({instruction} @liste)

renvoie la liste constituée des valeurs successives de l'expression évaluée

- map( { -$_ } @t ) : renvoie les valeurs opposés de la liste
-  map( { fonction($_) } @t ) : renvoie les valeurs renvoyer par la fonction 

### Hachage

**keys**

    keys(%hachage)

retourne un tableau des clefs d'une table de hachage

---

**values**

    values(%hachage)

retourne un tableau des valeurs d'une table de hachage

---

**each**

    each(%hachage)

renvoie tout les couples de la table de hachage

    my ($k,$v) = each(%h)

---

**delete**

    delete($hach{clef})

supprime la clef de la table de hachage

### Manipulation de fichier

**open**

open(descripteur, mode, nomFichier);

Ouvre un fichier, afin de le manipler

open(descripteur,"commande|")

ex : open($fd, "ls|);

---

**stat**

    stat($nomFichier)

Prend en entré un nom de fichier et renvoie plusieurs information autour du fichier
1. périphérique qui contient le fichier
2. le numéro d'inode
3. les droits d'accès
4. le nombre de lien vers le fichier
5. identifiant de l'utilisateur propriétaire
6. identifiant du groupe propriétaire
7. taille du fichier(en octets)
8. horodatage de la dernière modification 
9. horodatage de la dernière accès
10. L'horodatage de la dernière modification des métadonnées (ex : droit d'accès)

---

**glob**

    glob($expression)
    </chemin/expression>

renvoie la liste des noms de fichiers qui correspondent à l'expression

glob("*.txt") : renvoie tout les fichiers qui ont l'extension txt

---

**read**

    read(descripteur,tampon,tailleALire);

Les données sont rangée dans la variable tampon

#### Fichier binaire

**binmode**

    binmode (descripeur)

assure que le fichier ouvert est un fichier binaire

---

**sysopen**

    sysopen(descripteur, nomFichier,mode, permission)

offre un contôle directe sur le fichier. Offre plus d'option

    $mode = O_WRONLY | O_CREAT | O_TRUNC;
    my $permissions = 0666;

    sysopen(my $fh, "fichier.txt, $mode, 0666) 
        or die "Impossible d'ouvrir le fichier : $!";
    print $fh "Ceci est un exemple de texte écrit dans un fichier.\n";
    close($fh);

- O_WRONLY : ouvre en mode écriture
- O_CREAT : Créer le fichier s'il n'existe pas
- O_TRUNC : Vide le fichier s'ik existe déjà

---

**sysread**

    sysread(descripteur,buffer,taille_octets)

Lit un fichier binaire et stock le contenu dans le buffer

---

**syswrite**

    syswrite(descripteur,data);

Ecris dans le fichier binaire

---

**close**

    close(descripteur)

Ferme le fichier

### Expression régulière

**tr**

### Module

#### Time

### autre

**ReadMode**