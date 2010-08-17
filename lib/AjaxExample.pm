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

    # Simple text message on demand. 
    # See AjaxExample::Example::welcome_message for details
    $r->route('/server-message')
      ->to('example#welcome_message')
      ->name('welcome message');
}

1;
