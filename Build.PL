# Build.PL for Perl::Critic::Policy::logicLAB::RequireParamsValidate

# $Id: Build.PL 7707 2011-06-08 21:19:25Z jonasbn $

use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    dist_author => 'Jonas B. Nielsen, (jonasbn) <jonasbn@cpan.org>',
    module_name => 'Perl::Critic::Policy::logicLAB::RequireParamsValidate',
    dist_version_from =>
        'lib/Perl/Critic/Policy/logicLAB/RequireParamsValidate.pm',
    license => 'artistic',
#REF: http://logicLAB.jira.com/wiki/display/OPEN/Module-Build#Module-Build-AutogeneratetheMakefile.PLforbackwardscompatibility
    create_makefile_pl   => 'traditional',
    create_readme        => 1,
    recursive_test_files => 1,
    requires             => {
        'List::MoreUtils'      => '0',
        'Params::Validate'     => '0',
        'Perl::Critic::Policy' => '0',
        'Perl::Critic::Utils'  => '0',
    },
    build_requires => {
        'File::Spec'          => '0',    #core
        'Test::Perl::Critic'  => '0',
        'Test::Prereq::Build' => '0',
    },
    meta_merge => {
        resources => {
            homepage => 'http://logiclab.jira.com/wiki/display/PCPLRPV/Home',
            bugtracker => 'http://rt.cpan.org/NoAuth/Bugs.html?Dist=Perl-Critic-logicLAB-RequireParamsValidate',
            repository => 'https://github.com/jonasbn/pcplrpv',
            ProjectChangelog =>
                'http://logiclab.jira.com/browse/PCPLRPV#selectedTab=com.atlassian.jira.plugin.system.project%3Achangelog-panel',
            ProjectSite => 'http://logicLAB.jira.com/browse/PCPLRPV',
            ProjectWiki => 'http://logiclab.jira.com/wiki/display/PCPLRPV/Home',
        }
    },
);
$build->create_build_script();

__END__

=pod

=head1 SEE ALSO

=over

=item * L<http://logicLAB.jira.com/wiki/display/OPEN/Module-Build#Module-Build-AutogeneratetheMakefile.PLforbackwardscompatibility>

=back

=cut
