package HTTP::Throwable::Role::JSONBody;
# ABSTRACT - JSON Body

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

no Moo::Role; 1;
__END__

=head1 OVERVIEW

This role does two things - accepts a C<payload> argument that should be
anything you can pass to L<JSON/"encode_json">, and then encodes it as the
body, specifying a C<Content-Type> of C<application/json>.

=cut
