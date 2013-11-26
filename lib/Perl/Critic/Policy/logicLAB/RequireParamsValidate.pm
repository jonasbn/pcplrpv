package Perl::Critic::Policy::logicLAB::RequireParamsValidate;

# $Id: ProhibitShellDispatch.pm 8114 2013-07-25 12:57:04Z jonasbn $

use strict;
use warnings;
use base 'Perl::Critic::Policy';
use Perl::Critic::Utils qw{ $SEVERITY_MEDIUM };
use Data::Dumper;
use List::MoreUtils qw(any);

use 5.006;

our $VERSION = '0.01';

Readonly::Scalar my $EXPL => q{Use Params::Validate for public facing APIs};
Readonly::Scalar my $warning =>
    q{Parameter validation not complying with required standard};

use constant supported_parameters => ();
use constant default_severity     => $SEVERITY_MEDIUM;
use constant default_themes       => qw(logiclab);

## no critic (RequireParamsValidate);

sub applies_to {
    return (
        qw(
            PPI::Statement::Sub
            )
    );
}

sub violates {
    my ( $self, $elem ) = @_;

    #For debugging removing all whitespace
    $elem->prune('PPI::Token::Whitespace');

    my $words = $elem->find('PPI::Token::Word');

    if (    $words->[0]->content eq 'sub'
        and $words->[1]->content !~ m/\b_\w+\b/xsm )
    {
        return $self->_assert_params_validate( $elem, $words );
    }

    return;
}

sub _assert_params_validate {
    my ( $self, $elem, $elements ) = @_;

    my @params_validate_keywords = qw(validate validate_pos validate_with);
    my $ok;

    foreach my $word ( @{$elements} ) {
        if ( any { $word->content eq $_ } @params_validate_keywords ) {
            $ok++;
            last;
        }
    }

    if ($ok) {
        return;
    } else {
        return $self->violation( $warning, $EXPL, $elem );
    }
}

1;

__END__

=head1 NAME

Perl::Critic::Policy::logicLAB::RequireParamsValidate - simple policy for enforcing use of Params::Validate

=head1 AFFILIATION 

This policy is a policy in the Perl::Critic::logicLAB distribution. The policy
is themed: logiclab.

=cut

