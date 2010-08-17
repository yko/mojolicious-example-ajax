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
}

1;
