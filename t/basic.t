use strict;
use warnings;

use Test::More;

use JSON;

use HTTP::Throwable::JSONFactory qw(http_exception);

is(
  http_exception(Gone => {
    json => {
      what => 'for',
    },
  }),
  <<EOF,
410 Gone

{"what":"for"}
EOF
  "seems to work"
);

done_testing;
