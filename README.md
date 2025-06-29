[![Actions Status](https://github.com/bduggan/raku-duck-csv/actions/workflows/linux.yml/badge.svg)](https://github.com/bduggan/raku-duck-csv/actions/workflows/linux.yml)
[![Actions Status](https://github.com/bduggan/raku-duck-csv/actions/workflows/macos.yml/badge.svg)](https://github.com/bduggan/raku-duck-csv/actions/workflows/macos.yml)

NAME
====

Duck::CSV - Read CSV files using DuckDB

SYNOPSIS
========

    use Duck::CSV;

    my @rows = read-csv($*TMPDIR.child("data.csv"));

    for @rows -> $row {
        say "Row: " ~ ++$;
        for $row.keys -> $key {
            say "  $key: {$row{$key}}";
        }
    }

DESCRIPTION
===========

This module exports a single function `read-csv` that parses a CSV file. It uses duckdb for the parsing, and is equivalent to `select * from read_csv('file.csv')`. Rows are returns as hashes; the keys are column names taken from the first row of the CSV file.

More options are coming soon.

SUBROUTINES
===========

read-csv
--------

    multi sub read-csv(Str $file)
    multi sub read-csv(IO::Path $file)

Reads a CSV file and returns an array of rows. Each row is an array of strings representing the values in the CSV.

The parameter can be either a string representing the file path or an `IO::Path` object.

  * file

The path to the CSV file.

EXAMPLE
=======

    use Duck::CSV;

    # Create a dummy CSV file
    spurt "data.csv", "name,age\nJohn,30\nJane,25";

    my @rows = read-csv("data.csv");

    for @rows -> $row {
        say $row.join(",");
    }

TODO
====

Support all the options of `read_csv` in DuckDB, such as `header`, `delim`, etc.

