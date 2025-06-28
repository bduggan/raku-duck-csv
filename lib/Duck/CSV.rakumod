unit module Duck::CSV;
use Duckie;

=begin pod

=head1 NAME

Duck::CSV - Read CSV files using DuckDB

=head1 SYNOPSIS

    use Duck::CSV;

    my @rows = read-csv("mydata.csv");
    for @rows -> $row {
        say $row.join(",");
    }

=head1 DESCRIPTION

This module provides a simple way to read CSV files into Raku using DuckDB.
It uses the DuckDB SQL engine to efficiently parse and query CSV data.

=head1 SUBROUTINES

=head2 read-csv

    sub read-csv(Str $file)

Reads a CSV file and returns an array of rows. Each row is an array of strings representing the values in the CSV.

=item file

The path to the CSV file.

=head1 EXAMPLE

    use Duck::CSV;

    # Create a dummy CSV file
    spurt "data.csv", "name,age\nJohn,30\nJane,25";

    my @rows = read-csv("data.csv");

    for @rows -> $row {
        say $row.join(",");
    }

=end pod

sub read-csv(Str $file) is export {
  my $db = Duckie.new;
  my $q = $db.query: "select * from '$file'";
  my @rows = $q.rows;
  return @rows;
}
