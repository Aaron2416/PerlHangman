#!/usr/bin/perl
use strict;
use warnings;

print "Enter a word for someone to guess: ";
my $secret_word = <STDIN>;
chomp $secret_word;

my $guess_word = '*' x length $secret_word;
my $guesses = '';

while ($guess_word ne $secret_word) {
    print "Guess a letter: ";
    my $guess = <STDIN>;
    chomp $guess;

    if ($guess =~ /[^a-z]/i || length($guess) != 1) {
        print "Please guess one letter at a time.\n";
        next;
    }

    if (index($secret_word, $guess) != -1) {
        for my $i (0 .. length($secret_word) - 1) {
            if (substr($secret_word, $i, 1) eq $guess) {
                substr($guess_word, $i, 1) = $guess;
            }
        }
        print "Correct guess!\n";
    } else {
        print "Incorrect guess.\n";
        $guesses .= $guess;
    }

    print "Word: $guess_word\n";
    print "Incorrect guesses: $guesses\n";
}

print "Congratulations, you guessed the word: $secret_word\n";