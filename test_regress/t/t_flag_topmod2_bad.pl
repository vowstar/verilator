#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2008 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

scenarios(vlt => 1);

compile(
    v_flags2 => ["--top-module a "],
    fails => $Self->{vlt},
    nc => 0,  # Need to get it not to give the prompt
    expect =>
'%Error: Specified --top-module \'a\' isn.t at the top level, it.s under another cell \'a_top\'
%Error: Exiting due to.*',
    );

ok(1);
1;
