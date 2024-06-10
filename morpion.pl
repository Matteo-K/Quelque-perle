#! /usr/bin/perl

use strict;
use warnings;
use Switch;
use Term::ANSIColor;

# Constant
my $SIZE = 3;

sub main{
    my $replay = "";
    my $res;
    my $whoStart = int(rand(2));
    # ask name of player

    my %player;
    print "Player name ?";
    $player{"player1"} = <STDIN>;
    chomp $player{"player1"};
    print "Enter the name of the rival ?";
    $player{"player2"} = <STDIN>;
    chomp $player{"player2"};

    do {
        $whoStart = ($whoStart + 1)%2;
        my $grid = initGrid();
        my $stop = $SIZE * $SIZE;
        # Boucle de jeu
        while ($stop != 0) {
            if (($stop+$whoStart) % 2 == 0) {
                print "Au tour de ";
                print color 'red';
                print $player{"player1"};
                print color 'reset';
                print " : \n";
            } else {
                print "Au tour de ";
                print color 'blue';
                print $player{"player2"};
                print color 'reset';
                print " : \n";
            }
            printGrid($grid);
            round($grid,($stop+$whoStart)% 2);

            $res = checkVictory($grid,($stop+$whoStart)% 2);
            if ($res == 1){
                $stop = 1;
                if (($stop+$whoStart) % 2 == 1){
                    $res = 2;
                }
            }
            $stop--;
        }
        # Result of the game
        switch ($res) {
            case 0 { 
                print "match null\n"; 
            }
            case 1 {
                print "Player ";
                print color 'red';
                print $player{"player1"};
                print color 'reset';
                print " won\n"; 
            }
            case 2 {
                print "Player ";
                print color 'blue';
                print $player{"player2"};
                print color 'reset';
                print " won\n"; 
            }
            else { 
                print "error values"; 
            }
        }
        printGrid($grid);
        # ask player, replay the game
        do {
            print "Do you want replay ?(Y/N)";
            $replay = <STDIN>;
            chomp $replay;
            if (($replay ne "Y") && ($replay ne "N")) {
                print "enter Y or N\n";
            }
        } while(($replay ne "Y") && ($replay ne "N"));
    } while($replay eq "Y");
}

sub initGrid {
    # Initialise la grille du morpion
    my @grid;
    for (my $line = 0; $line < $SIZE; $line++){
        for (my $column = 0; $column < $SIZE; $column++){
            #Initialise une ligne
            $grid[$line][$column] = -1;
        }
    }
    return \@grid;
}

sub round {
    # play round
    # ask the coordinate of the tile
    # check if it's possible
    my ($grid_ref,$player) = @_;
    my $line;
    my $column;
    do {
        $line = input();
        $column = input();
    } while (!possible($grid_ref, $line, $column));
    $grid_ref -> [$line]->[$column] = $player;
}

sub input {
    # Ask a number beetween 0 and the size of the grid
    my $id;
    do {
        print "Enter ?";
        $id = <STDIN>;
        chomp $id;
    } while(int($id) < 0 || int($id) >= $SIZE );
    return int($id);
}

sub possible {
    # Check if the positionis correct
    my ($grid_ref,$line,$column) = @_;
    my $res = 0;
    if ($grid_ref->[$line]->[$column] == -1){
        $res = 1;
    } else {
        print "Impossible case non-vide\n";
    }
    return $res;
}

sub checkVictory {
    # check if player won the game
    my ($grid_ref, $player) = @_;

    # Check lines
    for my $line (0 .. $SIZE-1) {
        my $count = 0;
        for my $column (0 .. $SIZE-1) {
            if ($grid_ref->[$line][$column] == $player) {
                $count++;
            }
        }
        return 1 if $count == $SIZE;
    }

    # Check columns
    for my $column (0 .. $SIZE-1) {
        my $count = 0;
        for my $line (0 .. $SIZE-1) {
            if ($grid_ref->[$line][$column] == $player) {
                $count++;
            }
        }
        return 1 if $count == $SIZE;
    }

    # Check diagonal (top-left to bottom-right)
    my $count = 0;
    for my $i (0 .. $SIZE-1) {
        if ($grid_ref->[$i][$i] == $player) {
            $count++;
        }
    }
    return 1 if $count == $SIZE;

    # Check diagonal (top-right to bottom-left)
    $count = 0;
    for my $i (0 .. $SIZE-1) {
        if ($grid_ref->[$i][$SIZE-1-$i] == $player) {
            $count++;
        }
    }
    return 1 if $count == $SIZE;

    return 0;
}

sub printGrid {
    # Display the grid for the user
    my $grid_ref = shift;
    foreach my $line (@$grid_ref){
        foreach my $value (@$line){
            if ($value == 0){
                print "X ";
            } elsif ($value == 1) {
                print "O ";
            } else {
                print ". ";
            }
        }
        print "\n";
    }
}


main();