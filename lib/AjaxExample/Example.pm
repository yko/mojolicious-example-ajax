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

=head2 update_welcome_message()

This action will update server message in static file
and say 'ok' if everything allright or render error message,
is something wrong.

=cut

sub update_welcome_message {
    my $c = shift;
    
    # Get your 'public' dir path
    my $path = $c->app->static->root . '/server_message.html';

    # Get user input
    my $message = $c->param('new_message');

    # Just to test error messages, force user to write something
    if (length $message < 5) {
        return $c->render_text(
            "Message '$message' is too short. Write more than 5 characters!"
        );
    }

    # Open file for writing;
    open my $MSG, '>', $path;

    # Render error message and exit, if we can not write
    unless ($MSG) {
        return $c->render_text(
            "Uneable to open file 'server_message.html' for writing: $!"
        );
    }

    # Save content
    print $MSG $message;
    close $MSG;

    # Render confirmation
    $c->render_text(
        'ok'
    );
}

1;
