package GeoIP2::Record::MaxMind;

use strict;
use warnings;

our $VERSION = '2.003006';

use Moo;

use GeoIP2::Types qw( NonNegativeInt );

use namespace::clean -except => 'meta';

has queries_remaining => (
    is  => 'ro',
    isa => NonNegativeInt,
);

1;

# ABSTRACT: Contains data for the maxmind record returned from a web service query

__END__

=head1 SYNOPSIS

  use 5.008;

  use GeoIP2::WebService::Client;

  my $client = GeoIP2::WebService::Client->new(
      user_id     => 42,
      license_key => 'abcdef123456',
  );

  my $insights = $client->insights( ip => '24.24.24.24' );

  my $maxmind_rec = $insights->maxmind();
  print $maxmind_rec->queries_remaining(), "\n";

=head1 DESCRIPTION

This class contains the maxmind record data returned from a web service query.

Unlike other record classes, the data in this record is associated with your
MaxMind account, not with an IP address.

This record is returned by all the end points.

=head1 METHODS

This class provides the following methods:

=head2 $maxmind_rec->queries_remaining()

The number of queries remaining for the end point you just queried. Note that
this is an approximation as query counts are only periodically synced across
all of MaxMind's servers.
