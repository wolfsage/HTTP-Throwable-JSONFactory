package HTTP::Throwable::Role::JSONBody;

use Moo::Role;
use JSON::MaybeXS;

has json => (
  is => 'ro',
  required => 1,
);

sub body {
  my $self = shift;

  return encode_json($self->json);
}

sub body_headers {
  my ($self, $body) = @_;

  return [
    'Content-Type' => 'text/plain',
    'Content-Length' => length $body,
  ];
}

sub as_string {
  my $self = shift;

  return   $self->status_line
         . "\n\n"
         . $self->body
         . "\n";
}

1;
