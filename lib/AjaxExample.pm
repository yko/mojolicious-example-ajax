package AjaxExample;

use strict;
use warnings;

use base 'Mojolicious';

# This method will run once at server start
sub startup {
    my $self = shift;

    # Routes
    my $r = $self->routes;

    # Default route, points to AjaxExample::Example::welcome() action
    $r->route('/')->to('example#welcome');

    # Get server message. Will work only with GET method
    # See AjaxExample::Example::welcome_message for details
    $r->route('/server-message')
      ->to('example#welcome_message')
      ->name('welcome message')
      ->via('get');

    # Update text message.Works only with POST method.
    # See AjaxExample::Example::update_welcome_message for details
    $r->route('/server-message')
      ->to('example#update_welcome_message')
      ->name('update welcome message')
      ->via('post');
}

1;
