package HTTP::Throwable::Role::JSONBody;
# ABSTRACT - JSON Body

use Moo::Role;
use JSON::MaybeXS;

has payload => (
  is => 'ro',
);

sub body {
  my $self = shift;

  # Preempt bad clients that can't handle application/json with empty
  # body
  return "{}" unless $self->payload;

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

This role does two things - accepts an optional C<payload> argument that
should be anything you can pass to L<JSON/"encode_json">, and then encodes
it as the body, specifying a C<Content-Type> of C<application/json>. If no
C<payload> is provided, the body will be C<{}>.

=cut
