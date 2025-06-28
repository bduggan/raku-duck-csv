[![Actions Status](https://github.com/bduggan/raku-duck-csv/actions/workflows/linux.yml/badge.svg)](https://github.com/bduggan/raku-duck-csv/actions/workflows/linux.yml)
[![Actions Status](https://github.com/bduggan/raku-duck-csv/actions/workflows/macos.yml/badge.svg)](https://github.com/bduggan/raku-duck-csv/actions/workflows/macos.yml)

NAME
====

Duck::CSV - Read CSV files using DuckDB

SYNOPSIS
========

    use Duck::CSV;

    my @rows = read-csv("mydata.csv");
    for @rows -> $row {
        say $row.join(",");
    }

DESCRIPTION
===========

This module provides a simple way to read CSV files into Raku using DuckDB. It uses the DuckDB SQL engine to efficiently parse and query CSV data.

SUBROUTINES
===========

read-csv
--------

    sub read-csv(Str $file)

Reads a CSV file and returns an array of rows. Each row is an array of strings representing the values in the CSV.

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

