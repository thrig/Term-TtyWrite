# -*- Perl -*-
#
# remote control a terminal
#
# Run perldoc(1) on this file for additional documentation. See
# TtyWrite.xs for the code actual.

package Term::TtyWrite;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Term::TtyWrite', $VERSION);

1;
__END__

=head1 NAME

Term::TtyWrite - remote control a terminal

=head1 SYNOPSIS

As root.

  use Term::TtyWrite;

  my $tty = Term::TtyWrite->new("/dev/ttyp1");

  $tty->write("echo hi\n");

=head1 DESCRIPTION

Remote control a terminal via the C<TIOCSTI> B<ioctl>. This typically
requires that the code be run as root, or on Linux that the appropriate
capability has been granted.

This module will throw an exception if anything goes awry; use C<eval>
or L<Try::Tiny> to catch these, if necessary.

=head1 METHODS

=over 4

=item B<new> I<device-path>

Constructor; returns an object that the B<write> method may be used on.
The B<new> method requires that a path to a device be supplied. These
will vary by operating system, and can be listed for a given terminal
with the L<tty(1)> command.

=item B<write> I<string>

Writes the given I<string> to the terminal device specified in the
constructor B<new>.

=back

=head1 BUGS

=head2 Reporting Bugs

Please report any bugs or feature requests to
C<bug-term-ttywrite at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Term-TtyWrite>.

Patches might best be applied towards:

L<https://github.com/thrig/Term-TtyWrite>

=head2 Known Issues

Untested portability given the use of particular ioctl()s that
L<perlport> warns about. The security concerns of running as root.

=head1 AUTHOR

thrig - Jeremy Mates (cpan:JMATES) C<< <jmates at cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2016 by Jeremy Mates

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a copy
of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

=cut
