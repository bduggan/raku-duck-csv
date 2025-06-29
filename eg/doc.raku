use Duck::CSV;

# Create a dummy CSV file
spurt $*TMPDIR.child("data.csv"), "name,age\nJohn,30\nJane,25";

my @rows = read-csv($*TMPDIR.child("data.csv"));

for @rows -> $row {
    say "Row: " ~ ++$;
    for $row.keys -> $key {
        say "  $key: {$row{$key}}";
    }
}
unlink $*TMPDIR.child("data.csv");
