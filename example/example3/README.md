# Example2
This is a programming language.
It's witten by bittn.

[English](https://translate.google.com/translate?hl=en&sl=ja&tl=en&u=https://github.com/pinenut-programming-language/bittn/tree/master/example/example1)

[日本語](https://github.com/pinenut-programming-language/bittn/tree/master/example/example1)

これは、とても小さな言語です。
メソッドは、`print`のみです。
型は、`string`と`integer`のみです。
変数は使えません。

```
$ pwd
bittn/example/example2
$ bittn bikefile.rb sourcescript.rb
Hello, World by example2!
This is very small launguage.
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
{:code=>
  [{:line=>
     {:func=>
       {:idens=>"print"@0,
        :param=>
         {:value=>{:string=>{:chars=>"Hello, World by example2!\\n"@7}}}}}},
   {:line=>
     {:func=>
       {:idens=>"print"@37,
        :param=>
         {:value=>
           {:string=>{:chars=>"This is very small launguage.\\n"@44}}}}}}]}
FINISHED : PARSE
NEW BLOCK : ---- START TRANSFORM --------------------------------
RESULT :
["\x04\bo:\rCodeNode\x06:\n" +
 "@data[\a[\x06\"\x02\xCC\x05\x04\bo:\rLineNode\x06:\n" +
 "@data[\x06[\x06\"\x02\xAF\x05\x04\bo:\rFuncNode\x06:\n" +
 "@data[\a[\a\"\x023\x01\x04\bo:\x0EIdensNode\x06:\n" +
 "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
 "print(\"This is very small launguage.\\n\")\n" +
 "\x06:\x06ET:\r@byteposi\x00:\t@strI\"\n" +
 "print\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS\"\x02\x8F\x01\x04\bo:\x0EParamNode\x06:\n" +
 "@data[\x06[\x06\"\x02q\x01\x04\bo:\x0EValueNode\x06:\n" +
 "@data[\x06[\x06\"\x02S\x01\x04\bo:\x0FStringNode\x06:\n" +
 "@data{\x06:\n" +
 "charso:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
 "print(\"This is very small launguage.\\n\")\n" +
 "\x06:\x06ET:\r@byteposi\f:\t@strI\" Hello, World by example2!\\n\x06;\fT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS[\a\"\x023\x01\x04\bo:\x0EIdensNode\x06:\n" +
 "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
 "print(\"This is very small launguage.\\n\")\n" +
 "\x06:\x06ET:\r@byteposi\x00:\t@strI\"\n" +
 "print\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS\"\x02\x8F\x01\x04\bo:\x0EParamNode\x06:\n" +
 "@data[\x06[\x06\"\x02q\x01\x04\bo:\x0EValueNode\x06:\n" +
 "@data[\x06[\x06\"\x02S\x01\x04\bo:\x0FStringNode\x06:\n" +
 "@data{\x06:\n" +
 "charso:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
 "print(\"This is very small launguage.\\n\")\n" +
 "\x06:\x06ET:\r@byteposi\f:\t@strI\" Hello, World by example2!\\n\x06;\fT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS[\x06\"\x02\xD4\x05\x04\bo:\rLineNode\x06:\n" +
 "@data[\x06[\x06\"\x02\xB7\x05\x04\bo:\rFuncNode\x06:\n" +
 "@data[\a[\a\"\x023\x01\x04\bo:\x0EIdensNode\x06:\n" +
 "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
 "print(\"This is very small launguage.\\n\")\n" +
 "\x06:\x06ET:\r@byteposi*:\t@strI\"\n" +
 "print\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS\"\x02\x93\x01\x04\bo:\x0EParamNode\x06:\n" +
 "@data[\x06[\x06\"\x02u\x01\x04\bo:\x0EValueNode\x06:\n" +
 "@data[\x06[\x06\"\x02W\x01\x04\bo:\x0FStringNode\x06:\n" +
 "@data{\x06:\n" +
 "charso:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
 "print(\"This is very small launguage.\\n\")\n" +
 "\x06:\x06ET:\r@byteposi1:\t@strI\"$This is very small launguage.\\n\x06;\fT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS[\a\"\x023\x01\x04\bo:\x0EIdensNode\x06:\n" +
 "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
 "print(\"This is very small launguage.\\n\")\n" +
 "\x06:\x06ET:\r@byteposi*:\t@strI\"\n" +
 "print\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS\"\x02\x93\x01\x04\bo:\x0EParamNode\x06:\n" +
 "@data[\x06[\x06\"\x02u\x01\x04\bo:\x0EValueNode\x06:\n" +
 "@data[\x06[\x06\"\x02W\x01\x04\bo:\x0FStringNode\x06:\n" +
 "@data{\x06:\n" +
 "charso:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
 "print(\"This is very small launguage.\\n\")\n" +
 "\x06:\x06ET:\r@byteposi1:\t@strI\"$This is very small launguage.\\n\x06;\fT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS"]
FINISHED : TRANSFORM
NEW BLOCK : ---- START RUN --------------------------------------
Hello, World by example2!
This is very small launguage.
RESULT :
[["\x04\bo:\rLineNode\x06:\n" +
  "@data[\x06[\x06\"\x02\xAF\x05\x04\bo:\rFuncNode\x06:\n" +
  "@data[\a[\a\"\x023\x01\x04\bo:\x0EIdensNode\x06:\n" +
  "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
  "print(\"This is very small launguage.\\n\")\n" +
  "\x06:\x06ET:\r@byteposi\x00:\t@strI\"\n" +
  "print\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS\"\x02\x8F\x01\x04\bo:\x0EParamNode\x06:\n" +
  "@data[\x06[\x06\"\x02q\x01\x04\bo:\x0EValueNode\x06:\n" +
  "@data[\x06[\x06\"\x02S\x01\x04\bo:\x0FStringNode\x06:\n" +
  "@data{\x06:\n" +
  "charso:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
  "print(\"This is very small launguage.\\n\")\n" +
  "\x06:\x06ET:\r@byteposi\f:\t@strI\" Hello, World by example2!\\n\x06;\fT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS[\a\"\x023\x01\x04\bo:\x0EIdensNode\x06:\n" +
  "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
  "print(\"This is very small launguage.\\n\")\n" +
  "\x06:\x06ET:\r@byteposi\x00:\t@strI\"\n" +
  "print\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS\"\x02\x8F\x01\x04\bo:\x0EParamNode\x06:\n" +
  "@data[\x06[\x06\"\x02q\x01\x04\bo:\x0EValueNode\x06:\n" +
  "@data[\x06[\x06\"\x02S\x01\x04\bo:\x0FStringNode\x06:\n" +
  "@data{\x06:\n" +
  "charso:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
  "print(\"This is very small launguage.\\n\")\n" +
  "\x06:\x06ET:\r@byteposi\f:\t@strI\" Hello, World by example2!\\n\x06;\fT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS"],
 ["\x04\bo:\rLineNode\x06:\n" +
  "@data[\x06[\x06\"\x02\xB7\x05\x04\bo:\rFuncNode\x06:\n" +
  "@data[\a[\a\"\x023\x01\x04\bo:\x0EIdensNode\x06:\n" +
  "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
  "print(\"This is very small launguage.\\n\")\n" +
  "\x06:\x06ET:\r@byteposi*:\t@strI\"\n" +
  "print\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS\"\x02\x93\x01\x04\bo:\x0EParamNode\x06:\n" +
  "@data[\x06[\x06\"\x02u\x01\x04\bo:\x0EValueNode\x06:\n" +
  "@data[\x06[\x06\"\x02W\x01\x04\bo:\x0FStringNode\x06:\n" +
  "@data{\x06:\n" +
  "charso:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
  "print(\"This is very small launguage.\\n\")\n" +
  "\x06:\x06ET:\r@byteposi1:\t@strI\"$This is very small launguage.\\n\x06;\fT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS[\a\"\x023\x01\x04\bo:\x0EIdensNode\x06:\n" +
  "@datao:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
  "print(\"This is very small launguage.\\n\")\n" +
  "\x06:\x06ET:\r@byteposi*:\t@strI\"\n" +
  "print\x06;\vT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS\"\x02\x93\x01\x04\bo:\x0EParamNode\x06:\n" +
  "@data[\x06[\x06\"\x02u\x01\x04\bo:\x0EValueNode\x06:\n" +
  "@data[\x06[\x06\"\x02W\x01\x04\bo:\x0FStringNode\x06:\n" +
  "@data{\x06:\n" +
  "charso:\x13Parslet::Slice\b:\x0E@positiono:\x16Parslet::Position\a:\f@stringI\"Sprint(\"Hello, World by example2!\\n\")\n" +
  "print(\"This is very small launguage.\\n\")\n" +
  "\x06:\x06ET:\r@byteposi1:\t@strI\"$This is very small launguage.\\n\x06;\fT:\x10@line_cacheo:\x1FParslet::Source::LineCache\a:\x0F@line_endse:!Parslet::Source::RangeSearch[\ai*iS:\x13@last_line_endiS"]]
```
