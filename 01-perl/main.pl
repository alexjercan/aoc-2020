use warnings;
use strict;

my $input_path = "../input/day01.input";
my @expenses = ();

open my $input_fh, '<', $input_path or die "Could not open file '$input_path' $!";
while (my $line = <$input_fh>) {
    if ($line =~ /^\d+$/) {
        push @expenses, int($line);
    }
}
close $input_fh;

sub task1 {
    my @expenses = @_;
    for my $expense (@expenses) {
        for my $other_expense (@expenses) {
            if ($expense + $other_expense == 2020) {
                return $expense * $other_expense;
            }
        }
    }
}

print "Task 1: " . task1(@expenses) . "\n";

sub task2 {
    my @expenses = @_;
    for my $expense (@expenses) {
        for my $other_expense (@expenses) {
            for my $third_expense (@expenses) {
                if ($expense + $other_expense + $third_expense == 2020) {
                    return $expense * $other_expense * $third_expense;
                }
            }
        }
    }
}

print "Task 2: " . task2(@expenses) . "\n";