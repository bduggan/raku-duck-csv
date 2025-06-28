unit module Duck::CSV;
use Duckie;

sub read-csv(Str $file) is export {
  my $db = Duckie.new;
  my $q = $db.query: "select * from '$file'";
  my @rows = $q.rows;
  return @rows;
}

