# Example1
This is a programming language.
It's witten by bittn.

[English](https://translate.google.com/translate?hl=en&sl=ja&tl=en&u=https://github.com/pinenut-programming-language/bittn/tree/master/example/example2)

[日本語](https://github.com/pinenut-programming-language/bittn/tree/master/example/example2)

これは、数値パーサです。
出力はありません。
結果をみたい場合、`-d`もしくは`--debug`オプションを付与してください。

```
$ pwd
bittn/example/example1
$ bittn bikefile.rb sourcescript.rb
$ bittn -d bikefile.rb sourcescript.rb
-----------------------------------------------------------------
---------------- START DEBUG ------------------------------------
-----------------------------------------------------------------
NEW VALUE : prgconfig = {:debug=>true, :parse_only=>false, :transfrom_only=>false}
NEW VALUE : args = ["bikefile.rb", "sourcescript.rb"]
NEW VALUE : optvol = 1
NEW BLOCK : ---- START INPUTS -----------------------------------
NEW VALUE : filename = sourcescript.rb
NEW VALUE : bikefile = bikefile.rb
NEW BLOCK : ---- START PARSE ------------------------------------
RESULT :
{:code=>[{:line=>{:integer=>"1234"@0}}]}
FINISHED : PARSE
NEW BLOCK : ---- START TRANSFORM --------------------------------
RESULT :
["\x04\bo:\rCodeNode\x06:\n" +
 "@data[\x06[\x06\"\x02\x05\x01\x04\bo:\rLineNode\x06:\n" +
 "@data[\x06[\x06\"\x01\xE9\x04\bo:\x10IntegerNode\x06:\n" +
 "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"\n" +
 "1234\n" +
 "\x06:\x06ET:\r@byteposi\x00:\t@strI\"\t1234\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\x06i\n" +
 ":\x13@last_line_endi\n"]
FINISHED : TRANSFORM
NEW BLOCK : ---- START RUN --------------------------------------
RESULT :
1234
```
