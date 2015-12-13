use strict;
use warnings;
use utf8;
use AozoraBunko::Tools::Checkerkun;
use Test::More;
binmode Test::More->builder->$_ => ':utf8' for qw/output failure_output todo_output/;

subtest 'duplication check for all hiden_no_tare chars' => sub {
    plan skip_all => 'duplications are allowed'; # 複数のタグをつけることで対処する

    my @key_list = (
        keys %{$AozoraBunko::Tools::Checkerkun::JYOGAI}
      , keys %{$AozoraBunko::Tools::Checkerkun::J78}
      , keys %{$AozoraBunko::Tools::Checkerkun::GONIN1}
      , keys %{$AozoraBunko::Tools::Checkerkun::GONIN2}
      , keys %{$AozoraBunko::Tools::Checkerkun::GONIN3}
      , keys %{$AozoraBunko::Tools::Checkerkun::KYUJI}
      , keys %{$AozoraBunko::Tools::Checkerkun::ITAIJI}
    );

    my %cnt;
    $cnt{$_}++ for @key_list;
    my @duplicate_chars = grep { $cnt{$_} > 1 } keys %cnt;

    is(scalar @duplicate_chars, 0, 'no duplications') or diag("duplicate chars: @duplicate_chars");
};

subtest 'duplication check for all gonin chars' => sub {
    subtest 'duplication check for keys' => sub {
        plan skip_all => 'duplications are allowed'; # 複数のタグをつけることで対処する

        my @key_list = (
            keys %{$AozoraBunko::Tools::Checkerkun::GONIN1}
          , keys %{$AozoraBunko::Tools::Checkerkun::GONIN2}
          , keys %{$AozoraBunko::Tools::Checkerkun::GONIN3}
        );

        my %cnt;
        $cnt{$_}++ for @key_list;
        my @duplicate_chars = grep { $cnt{$_} > 1 } keys %cnt;

        is(scalar @duplicate_chars, 0, 'no duplications') or diag("duplicate chars: @duplicate_chars");
    };

    subtest 'duplication check for keys and values' => sub {
        # GONIN 内のキーとバリューの重複までは認めない
        my %cnt;
        $cnt{"$_\n${$AozoraBunko::Tools::Checkerkun::GONIN1}{$_}"}++ for keys %{$AozoraBunko::Tools::Checkerkun::GONIN1};
        $cnt{"$_\n${$AozoraBunko::Tools::Checkerkun::GONIN2}{$_}"}++ for keys %{$AozoraBunko::Tools::Checkerkun::GONIN2};
        $cnt{"$_\n${$AozoraBunko::Tools::Checkerkun::GONIN3}{$_}"}++ for keys %{$AozoraBunko::Tools::Checkerkun::GONIN3};

        my @duplicate_kvs = grep { $cnt{$_} > 1 } keys %cnt;

        is(scalar @duplicate_kvs, 0, 'no duplications') or diag("duplicate chars: @duplicate_kvs");
    };
};

done_testing;
