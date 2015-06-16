#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More tests => 7;

use Color::Spectrum;

my $color = new_ok 'Color::Spectrum';

my @pcolor = Color::Spectrum::generate(4,"#FFFFFF","#000000");
is @pcolor, 4, 'elements generated (exported)';

my @ocolor = $color->generate(4,"#FFFFFF","#000000");
is @ocolor, 4, 'elements generated (instantiated)';

is eq_array( \@pcolor, \@ocolor ), 1, 'export vs instantiation';

my @color = $color->generate(0,"#FFFFFF","#000000");
is @color, 1, 'fix for bug 43939';

@color = $color->generate(2,"#FFFFFF","#000000");
is $color[0], '#FFFFFF', 'fix for bug 44015';
is $color[1], '#000000', 'fix for bug 44015';
