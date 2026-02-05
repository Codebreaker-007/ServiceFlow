use strict;
use warnings;
use Text::CSV;

my $csv = Text::CSV->new({ binary => 1 });
open my $fh, "<", "users.csv" or die "Cannot open file: $!";
while (my $row = $csv->getline($fh)) {
    print "Processing user: $row->[0]\n";
    # Add logic to insert into SQL db via DBI module
}
close $fh;