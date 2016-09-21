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

1;
