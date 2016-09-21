package HTTP::Throwable::Role::JSONBody;

use Moo::Role;
use JSON::MaybeXS;

has payload => (
  is => 'ro',
  required => 1,
);

sub body {
  my $self = shift;

  return encode_json($self->payload);
}

sub body_headers {
  my ($self, $body) = @_;

  return [
    'Content-Type' => 'application/json',
    'Content-Length' => length $body,
  ];
}

sub as_string {
  my $self = shift;

  return $self->body;
}

1;
