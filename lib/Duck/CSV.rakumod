unit module Duck::CSV;
use Duckie;

=begin pod

=head1 NAME

Duck::CSV - Fast CSV parsing using DuckDB

=head1 SYNOPSIS

    use Duck::CSV;

    my @rows = read-csv "data.csv";

    for @rows -> $row {
        say "Row: " ~ ++$;
        for $row.keys -> $key {
            say "  $key: {$row{$key}}";
        }
    }

=head1 DESCRIPTION

This module exports a single function `read-csv` that parses a CSV file.
It uses duckdb for the parsing, and is equivalent to `select * from read_csv('file.csv')`.
Rows are returns as hashes; the keys are column names taken from the first row of the CSV file.

More options are coming soon.

DuckDB's CSV parser is really fast!

=head1 SUBROUTINES

=head2 read-csv

    multi sub read-csv(Str $file)
    multi sub read-csv(IO::Path $file)

Reads a CSV file and returns an array of rows. Rows are hashes; keys are column names from the first row of the CSV file.

The parameter can be either a string representing the file path or an `IO::Path` object.

=head1 EXAMPLE

    use Duck::CSV;

    # Create a dummy CSV file
    spurt "data.csv", "name,age\nJohn,30\nJane,25";

    my @rows = read-csv("data.csv");

    for @rows -> $row {
        say $row.join(",");
    }

=head1 SEE ALSO

https://duckdb.org/2025/04/16/duckdb-csv-pollock-benchmark.html

=head1 TODO

Support all the options of `read_csv` in DuckDB, such as `header`, `delim`, etc.

=head1 AUTHOR

Brian Duggan

=end pod

multi read-csv(Str $file) is export {
  read-csv $file.IO;
}

multi read-csv(IO::Path $file) is export {
  my $db = Duckie.new;
  my $q = $db.query: "select * from read_csv('$file')";
  my @rows = $q.rows;
  return @rows;
}
