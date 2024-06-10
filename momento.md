# Momento - PERL

**Comment faire du Perl ?**

Documentation Perl : https://formation-perl.fr/guide-perl.html

1. [element de base](#element-de-base)
2. [Structure de Contrôle](#structure-de-contrôle)
3. [boucles](#boucle)
4. [tableaux](#tableau)
5. [fonction](#fonction)
6. [fichiers](#manipulation-de-fichier)
7. [Class](#les-class)

## EXTENSION

- use strict;
  - Force à faire un code propre
- use warnings;
  - affiche des avertissements
- use [Switch]();
  - ajoute la structure de donnée switch
- use Term::ANSIColor;
  - ajoute des modules pour ajouter de la couleur
- use BinaryWriter

## Element de base

### -- Affichage --

    print "text/$variable";
    say("text/$variable")

### -- Variable --

#### - Déclaration -

my $variable;

### -- Multi-déclaration --

my ($a,$b) = (1,2);

my ($c,$d) = @t;

### -- Affectation --

$a = 1 et $b = 2

    ($a,$b) = (1,2);

---

la valeur 3 n'est pas affecter

    ($a,$b) = (1,2,3);

---

$a = elt1 du return et $b = elt2 du return

    ($a,$b) = Fonction();

---

échange deux valeurs sans l'utilisation d'une 3e valeur

    ($a,$b) = ($b,$a);

---

    @s = (10,1,2,"age",20);
    ($a, @t, @u, $b) = @s;

équivaut à :

    @s = (10,1,2,"age",20);

    $a = 10;
    @t = (1,2,"age",20);
    @u = ();
    $b = undef;

### -- Opération --

- \+
- \-
- \*
- /

"30" + "12" = 42

- +=
- -=
- \*=
- .=
- =~ : vérifie si la variable correspond à [l'expression régulière](#expression-régulière)

### -- Concatenation --

    "$var1 text $var2"
    $var."text".$var2

### -- Variable importante --

$0 : contient le nom du fichier

$! : contient le message errno de la dernière erreur survenue

$. : contient le numéro de ligne du dernier fichier lu

### -- Demande utilisateur --

    my $variable = <STDIN>;

\<STDIN> permet de faire une requête utilisateur qui va contenir le contenu entrer par l'utilisateur et un retour à la ligne. Pour retirer se retour àla ligne, on utilise la fonction chomp.

    chomp $variable;

## Structure de contrôle

### -- symbole --

| contexte imposé | numérique | de chaînes |
| :-------------: | :-------: | :--------: |
|     égalité     |    ==     |     eq     |
|   différence    |    !=     |     ne     |
|   infériorité   |     <     |     lt     |
|   supériorité   |     >     |     gt     |
|   inf ou égal   |    <=     |     le     |
|   sup ou égal   |    >=     |     ge     |
|   comparaison   |    <=>    |    cmp     |

si $x <=> $y

- avec $x > $y donne >0
- avec $x < $y donne <0
- avec $x = $y donne 0

### -- Structure de base --

    if (condition) {
        instruction
    } elsif (condition) {
        instruction
    } else {
        instruction
    }

### -- Structure avancée --

    instruction if( condition );

print "$s\n" if( defined($s) ); #affiche la valeur de $s si elle est définie

    (condition) ? instruction_si : instruction_sinon;

### -- unless --

un si inversé, execute quand la condition est fausse

    unless(condition){

    }

### -- Switch --

utilisable avec l'extension Switch

    switch ($variable) {
        case scalaire {
            instruction
        }
        case scalaire2 {
            instruction
        }
        case scalaire3 {
            instruction
        }
        else {
            instruction
        }
    }

le switch permet d'executer des instructions qui diffèrent selon la valeur du scalaire de ala variable prise en entrer.

l'instruction est vérifier au case, le case vérifiesi les 2 scalaires sont égaux.

Si aucun case correpond au scalaire, le programme execute le else

## Boucle

### -- While --

itère tant que la condition est vrai

#### - Structure de base -

    while( condition ) {
        instructions;
    }

#### - Structure avancée -

    instruction while( condition );

#### -- Do --

    do {
        instruction;
    } while( condition );

fais l'instruction tant que l'instruction est vari

### -- until --

    until (condition) {
        instruction
    }

Une boucle qui itère tant que la condition est fausse. Qui est contraire à une boucle while

### -- for --

Boucle qui itère tant que la condition est vrai. Conseiller quand l'on connait la condition de fin

    for( initialisation; condition; incrément ) {
        instructions;
    }

---

    for (1..5){
        instruction
    }

### -- foreach --

    foreach $variable (liste){
        instructions
    }

Il est aussi possible de ne pas utiliser explicitement de variable de boucle ; dans ce cas c'est la variable spéciale $\_ qui sera automatiquement utilisée :

    foreach (liste) {
    print "$_\n";
    }

### next

    next if (condition);

next est une condition de structure de contrôle qui permet de sauter

    my @nombres = (1, 2, 3, 4, 5);
    foreach my $nombre (@nombres) {
        next if ($nombre == 3);
        print "$nombre\n";
    }

output : 3

#### - Parcours cles -

    foreach my $k (keys(%h)) {
        print "Clef=$k Valeur=$h{$k}\n";
    }

#### - Parcours valeurs -

    foreach my $v (values(%h)) {
        print "Valeur=$v\n";
    }

## Tableau

### -- déclaration --

    my @tab = (1,2,3,4,5);

---

    my @tab = (1..5)

### -- acces aux valeurs --

    $tab[$indice]

    $tab[-1] ou $tab[$#t]

### -- tableau à connaître --

@ARGV : est un tableau qui est toujours défini. Il n'a pas besoin d'être défini.

### -- L'opérateur qw --

qw permet de faciliter la lisibiliter d'une liste de chaine de caractère

@t = ( 'Ceci', 'est', 'quelque', 'peu', 'pénible','à', 'écrire', ',', 'non', '?' );

devient :

@t = qw(Cela est bien plus facile à faire non ?);

### -- Tranches --

@t[4,10] = (4321,"age");

($t[4],$t[10]) = (4321,"age");

Dans les deux cas 4321 est à l'indice 4 et "age" à l'indice 10

## Fonction

### -- Déclaration --

    sub nomFonction {
        corps fonction
        return ...;
    }

### -- Appellation --

Lors de l'appelle d'une fonction, on est pas obliger de rajouter les parenthèses. Mais se n'est pas tout le temps conseiller.

    nomFonction();
    &nomFonction();

### -- Paramètre --

my ($x,$y,$t) = @\_;

my $x = shift;

my $x = @\_; Incorrect

l'utilisation de shift permetd'obtenir le premier élément d'un tableau. Cette fonction marche sur @\_ par défault

Les paramètres sont stocké dans la liste @\_

## Hachage

### -- Déclaration --

%h = ();

### -- Accès au élément --

$h{clef};

### Autovivification

Si un élément de la table de hachage n'existe pas est incrémenter (avec un ++ ou .=) alors la table va créer un élément par défault. soit "" ou 0

### Taille

L'utilisation de scalar(\%h) ou $h envoie la dimension de la table de hachage

## Manipulation de fichier

### ouverture

    open (descripteur, mode, nomFichier);

La fonction renvoie un booléen si elle a réussi à ouvrir le fichier

| Caractère(s) |      Mode d'ouverture       |
| :----------: | :-------------------------: |
|      <       |        lecture seul         |
|      \>      |      écriture (écrase)      |
|     \>\>     |      écriture (ajout)       |
|     \+\>     | lecture & écriture (écrase) |
|     \+<      |  lecture & écritue (ajout)  |

ferme le fichier

    close (descripteur);

### -- lire --

    while( defined( $l = <descripteur> ) ) {
            chomp $l;
            print "$. : $l\n";
    }

### -- écritue --

    print (descripteur text);

---

    printf (descripteur mod, $variable);

### -- Fichier automatiquement ouvert --

- \<STDIN> : prend un entrer
- \<STDOU> : écris en sortie normal
- \<STDERR> : écris en sortie erreur
- \<ARGV> : la variable $ARGV contient le nom du fichier en cours

### -- Fichier binaire --

### -- test --

    if( test "chemin/fichier" ) {
    ...
    }

Ensemble des tests possibles sur un fichier :

Ensemble des test possible (**perldoc -f -X**)

| test | description                                                                                  |
| :--: | :------------------------------------------------------------------------------------------- |
|  -e  | vérifie si le fichier existe                                                                 |
|  -f  | vérifie si le fichier existe et est un fichier ordinaire                                     |
|  -d  | test si le chemin est un répertoire                                                          |
|  -l  | test si le paramètre est est un lien symbolique. Ceci n'exclut pas que -f ou -d renvoie vrai |
|  -r  | test si le programme peut lire le paramètre                                                  |
|  -w  | test si le programme peut ecrire dans le paramètre                                           |
|  -x  | test si le programme peut executer le paramètre                                              |
|  -u  | test si le propriétaire du fichier à les mêmes droit que le propriétaire du programme        |
|  -g  | test si le propriétaire du programme à les mêmes permissions que le group du fichier         |
|  -o  | test si le fichier appartient au propriétaire du programme                                   |
|  -z  | test si le fichier est vide                                                                  |
|  -s  | test si le fichier est non-vide                                                              |
|  -M  | renvoie l'âge en jour du fichier (depuis le début de l'exécution du programme)               |

## Expression Régulière

| Mode | dscription     |
| :--: | :------------- |
|  \n  | saut de ligne  |
|  \r  | retour chariot |
|  \t  | tabulation     |
|  \f  | saut de page   |
|  \e  | échappement    |

| raccourcie | description                                                                                |
| :--------: | :----------------------------------------------------------------------------------------- |
|     \d     | un chiffre, équivalent à [0-9] (d comme digit, chiffre en anglais) ;                       |
|     \D     | un non numérique, équivalent à [^0-9]                                                      |
|     \w     | un alphanumérique, équivalent à [0-9a-zA-Z_] (w comme word, c'est un caractère d'un mot) ; |
|     \W     | un non-alphanumérique, équivalent à [^0-9a-zA-Z_] ;                                        |
|     \s     | un espacement, équivalent à [ \n\t\r\f] (s comme space) ;                                  |
|     \S     | un non-espacement, équivalent à [^ \n\t\r\f].                                              |
|     \1     | contient le premier groupage de l'expression régulière à l'intérieur de l'expression       |
|     \2     | contient le second groupage de l'expression régulière à l'intérieur de l'expression        |

### fonctionnalités

#### La correspondance

le fait de vérifier si une chaine de caractère correpond à un mootif

m/motif/

le m représente un match et // délimite l'expressions

- pattern = motif

- matching = correspondance

#### la substitution

faire subir des transformations à la valeur d'une variable. Par exemple : remplacer dans la variable $v toutes les sous-chaînes toto par titi

s/motif/chaine/

le s désigne la substitution, les // le motif de recherche ainsi la chaine de remplacement à la suite

### Bind

lier une $variable à une /expression régulière/. Pour cela, on utilise =~

$v =~ m/^T/ : vérifie que la chaine commence par un T majuscule (Vrai ou Faux)

$v =~ s/voiture/pieds/ : remplace la première occurence de voiture par pieds

### Quantifieur

| caractère | le motif présent  | exemple   | mots matchés            |
| :-------- | :---------------- | :-------- | :---------------------- |
| \*        | 0 fois ou plus    | m/a\*/    | mot vide, a, aa, aaa... |
| \+        | 1 fois ou plus    | m/a\+/    | a, aa, aaa...           |
| ?         | 0 ou 1 fois       | m/a?/     | mot vide ou a           |
| {n}       | n fois exactement | m/a{4}/   | aaaa                    |
| {n,}      | au moins n fois   | m/a{2,}/  | aa, aaa, aaaa...        |
| {,n}      | au plus n fois    | m/a{,3}/  | mot vide, a, aa ou aaa  |
| {n,m}     | entre m et n fois | m/a{2,5}/ | aa, aaa, aaaa ou aaaaa  |

### Variable défini

- $1 contient le premier groupage de l'expression régulière à l'extérieur de l'expression

- $2 contient le second groupage de l'expression régulière à l'extérieur de l'expression

- $& vaut toute la sous-chaîne matchant ;

- $` vaut toute la sous-chaîne qui précède la sous-chaîne matchant ;

- $' vaut toute la sous-chaîne qui suit la sous-chaîne matchant.

exemple :

    my $v = "za aa et    tfe";
    if( $v =~ /(a+) et ([a-z])/ ) {
        print "$1\n";  # 'aa'
        print "$2\n";  # 't'
        print "$&\n";  # 'aa et t'
        print "$`\n";  # 'za '
        print "$'\n";  # 'fe'
    }

## Package

    package nomPackage;

un "paquetage" (package) est une manière d'organiser et de regrouper les variables, les sous-routines et les modules apparentés dans un espace de noms distinct. Cela permet d'éviter les conflits de noms entre les différentes parties d'un programme et facilite la réutilisation du code.

    1;

détermine la fin du package

### Variable globale

    our $variable

le our permet de déclarer une variable globale dans un package

## Les class

## Marque

Une marque est utilisé pour indiqué la fin des données associés à un programme

    while (my $line = \<DATA>) {
        print "Data: $line";
    }

    __DATA__
    Ceci est une ligne de données.
    Ceci est une autre ligne de données.
