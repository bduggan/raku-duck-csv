use Duck::CSV;

# Create a dummy CSV file
spurt $*TMPDIR.child("data.csv"), "name,age\nJohn,30\nJane,25";

my @rows = read-csv($*TMPDIR.child("data.csv"));

for @rows -> $row {
    say $row.join(",");
}
unlink $*TMPDIR.child("data.csv");
