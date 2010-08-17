package AjaxExample::Example;

use strict;
use warnings;

use base 'Mojolicious::Controller';

=head1 Controller Methods

=head2 welcome()

Rendering template example/welcome.html.ep
Before render, it sends 'message' into stash, so you can use it in template.

=cut

sub welcome {
    my $c = shift;

    # Render template "example/welcome.html.ep" with message
    $c->render(message => 'Welcome to the Mojolicious Web Framework!');
}

=head2 welcome_message()

This action will render piece of text from static file.
Note, that render_text() prevents Mojolicious from render any templates.

=cut

sub welcome_message {
    my $c = shift;
    
    # Render message from public file
    my $path = $c->render_static('server_message.html');
}

1;
