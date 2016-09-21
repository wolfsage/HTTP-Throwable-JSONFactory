package HTTP::Throwable::JSONFactory;
# ABSTRACT: Throw exceptions with JSON bodies

use strict;
use warnings;

use parent qw(HTTP::Throwable::Factory);

sub extra_roles {
  return qw(
    HTTP::Throwable::Role::JSONBody
  );
}

__END__

=head1 SYNOPSIS

  use HTTP::Throwable::JSONFactory qw(http_throw);

  http_throw(Gone => {
    payload => {
      error => "You won't find what you're looking for here",
    },
  });

=head1 OVERVIEW

This subclass of L<HTTP::Throwable::Factory> arranges for each built/thrown
exception to consume the L<HTTP::Throwable::Role::JSONBody> role, which
will generate HTTP responses with an C<application/json> content type and
encode the provided payload using L<JSON::MaybeXS>.

The C<payload> attribute passed to C<http_throw> or C<http_exception> should
be anything allowed by L<JSON/encode_json> (hashref, arrayref, etc).

=cut
