#!raku

use Duck::CSV;

sub MAIN($file) {
  my @rows = read-csv $file;
  .raku.say for @rows;
}


