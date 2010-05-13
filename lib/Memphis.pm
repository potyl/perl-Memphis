package Memphis;

=head1 NAME

Memphis - Cairo based OSM renderer, it draws OpenStreet Maps

=head1 SYNOPSIS

	use Memphis;

=head1 DESCRIPTION

Memphis consists of the Perl bindings for the C library libmemphis which is a
generic glib/cairo based OSM renderer library. It draws maps on arbitrary
cairo surfaces.

For more information about libmemphis see:
L<https://trac.openstreetmap.ch/trac/memphis/wiki/LibMemphis>.

=head1 AUTHORS

Emmanuel Rodriguez E<lt>potyl@cpan.orgE<gt>.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by Emmanuel Rodriguez.

This library is free software; you can redistribute it and/or modify
it under the same terms of:

=over 4

=item the GNU Lesser General Public License, version 2.1; or

=item the Artistic License, version 2.0.

=back

This module is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

You should have received a copy of the GNU Library General Public
License along with this module; if not, see L<http://www.gnu.org/licenses/>.

For the terms of The Artistic License, see L<perlartistic>.

=cut

use warnings;
use strict;

our $VERSION = '0.01';

use base 'DynaLoader';
use Exporter 'import';

use Glib;

sub dl_load_flags { $^O eq 'darwin' ? 0x00 : 0x01 }

__PACKAGE__->bootstrap($VERSION);

1;

