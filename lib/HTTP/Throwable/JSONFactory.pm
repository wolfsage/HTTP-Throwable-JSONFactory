package HTTP::Throwable::JSONFactory;

use strict;
use warnings;

use parent qw(HTTP::Throwable::Factory);

sub extra_roles {
  return qw(
    HTTP::Throwable::Role::JSONBody
  );
}

1;
