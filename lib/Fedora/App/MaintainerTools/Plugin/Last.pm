#############################################################################
#
# Update a Perl RPM spec with the latest GA in the CPAN
#
# Author:  Chris Weyl (cpan:RSRCHBOY), <cweyl@alumni.drew.edu>
# Company: No company, personal work
# Created: 05/12/2009 09:54:18 PM PDT
#
# Copyright (c) 2009 Chris Weyl <cweyl@alumni.drew.edu>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
#############################################################################

package Fedora::App::MaintainerTools::Plugin::Last;

use strict;
use warnings;

use autodie qw{ system };

our $VERSION = '0.001';

#############################################################################
# order

sub _order { 95 }

#############################################################################
# event: perl_spec_update 

sub perl_spec_update_order { 95 }

sub perl_spec_update {
    my ($self, $data) = @_;

    $data->log->info('In plugin: Last');

    $data->log->debug('Updating changelog...');
    my @lines = @{ $data->content };
    @lines = map { /^%changelog/ ? (@{ $data->changelog }, q{}) : $_ } @lines;
    
    $data->content(\@lines);
    return;
}    



1;

__END__

=head1 NAME

Fedora::App::MaintainerTools::Plugin::Last - Last things last

=head1 DESCRIPTION

This plugin runs last, and at the moment, handles updating the changelog.

=head1 PLUGIN ORDER

95.

=head1 SEE ALSO

L<Fedora::App::MaintainerTools>

=head1 AUTHOR

Chris Weyl  <cweyl@alumni.drew.edu>


=head1 LICENSE AND COPYRIGHT

Copyright (c) 2009 Chris Weyl <cweyl@alumni.drew.edu>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the 

    Free Software Foundation, Inc.
    59 Temple Place, Suite 330
    Boston, MA  02111-1307  USA

=cut
