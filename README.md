# NAME

AozoraBunko::Tools::Checkerkun - 青空文庫の工作員のための文字チェッカー（作：結城浩）をライブラリ化したもの

# SYNOPSIS

    use AozoraBunko::Tools::Checkerkun;
    use utf8;

    my $checker = AozoraBunko::Tools::Checkerkun->new();
    $checker->check('森鴎［＃「區＋鳥」、第3水準1-94-69］外💓'); # => '森鴎［＃「區＋鳥」、第3水準1-94-69］ → [78hosetsu_tekiyo]【鴎】 外💓 [gaiji]【💓】 '

# DESCRIPTION

AozoraBunko::Tools::Checkerkun は、青空文庫工作員のための文字チェッカーで、結城浩氏が作成したツールを私がライブラリ化したものです。

# METHODS

## $checker = AozoraBunko::Tools::Checkerkun->new(\\%option)

新しい Aozorabunko::Tools::Checkerkun インスタンスを生成する。

    my $checker = AozoraBunko::Tools::Checkerkun->new(
        'gaiji'            => 1, # JIS外字をチェックする
        'hansp'            => 1, # 半角スペースをチェックする
        'hanpar'           => 1, # 半角カッコをチェックする
        'zensp'            => 0, # 全角スペースをチェックする
        '78hosetsu_tekiyo' => 1, # 78互換包摂の対象となる不要な外字注記をチェックする
        'hosetsu_tekiyo'   => 1, # 包摂の対象となる不要な外字注記をチェックする
        '78'               => 0, # 78互換包摂29字をチェックする
        'jyogai'           => 0, # 新JIS漢字で包摂規準の適用除外となる104字をチェックする
        'gonin1'           => 0, # 誤認しやすい文字をチェックする(1)
        'gonin2'           => 0, # 誤認しやすい文字をチェックする(2)
        'gonin3'           => 0, # 誤認しやすい文字をチェックする(3)
        'simplesp'         => 0, # 半角スペースは「_」で、全角スペースは「□」で出力する
    );

上記のコードで設定されている値がデフォルト値です。

## $checked\_text = $checker->check($text)

new で指定したオプションでテキストをチェックします。戻り値はチェックされたテキストです。

# LICENSE

Copyright (C) pawa.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[チェッカー君](http://www.aozora.jp/tools/checker.cgi)

[外字](http://www.aozora.gr.jp/annotation/external_character.html)

[包摂 (文字コード) - Wikipedia](https://ja.wikipedia.org/wiki/%E5%8C%85%E6%91%82_\(%E6%96%87%E5%AD%97%E3%82%B3%E3%83%BC%E3%83%89\))

[JIS漢字で包摂の扱いが変わる文字（78互換包摂）](http://www.aozora.gr.jp/newJIS-Kanji/gokan_henkou_list.html)

# AUTHOR

pawa <pawa@pawafuru.com>
