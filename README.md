oversetter
===

[![oversetter](icon.png)](http://raw.githubusercontent.com/weirdpercent/oversetter/master/icon.png)

Icon by [A’Design Award & Competition, Onur Müştak Çobanlı and Farhat Datta](http://www.languageicon.org)

[![Build Status](https://travis-ci.org/weirdpercent/oversetter.svg?branch=master)](https://travis-ci.org/weirdpercent/oversetter) [![Gem Version](https://badge.fury.io/rb/oversetter.svg)](http://badge.fury.io/rb/oversetter) [![Code Climate](https://codeclimate.com/github/weirdpercent/oversetter/badges/gpa.svg)](https://codeclimate.com/github/weirdpercent/oversetter) [![Test Coverage](https://codeclimate.com/github/weirdpercent/oversetter/badges/coverage.svg)](https://codeclimate.com/github/weirdpercent/oversetter/coverage)

Oversetter is a text translation tool for the command line. It supports dozens of source and target languages. It requires a terminal emulator that supports UTF-8 encoding; I prefer [Terminator](http://gnometerminator.blogspot.com/p/introduction.html). Oversetter is best used for translating short snippets of text the length of a sentence. A list of ISO 639-1 and 639-2 [language codes](http://www.loc.gov/standards/iso639-2/php/English_list.php) can be helpful in setting the source and target languages.

_Oversetter_ is Norwegian for 'translator'.

### Resources

As Oversetter does have some limitations, these resources may be of some use to you:

- [Google Translate](http://translate.google.com) is not perfect, but it does perform translation & transliteration in realtime (as you type). It even provides sound clips (some pre-recorded, some synthesized).
- [Omniglot](http://www.omniglot.com) is an amazing resource for learning about languages, writing systems, and related topics. I thought about developing an interface for it in Oversetter, but it would be **way** too much work. Instead, we should all use Omniglot in its natural form.
- [translit.cc](http://translit.cc/) Translation & transliteration services w/ virtual keyboards for Armenian, Belarusian, Bulgarian, Georgian, Greek, Russian, and Ukranian, plus other useful tools like spell-checking.
- [romaji.me](http://romaji.me/) Transliterate between Japanese text (Kanji, Hiragana, Katakana) and English.

### Platform

Oversetter was designed with POSIX systems in mind, though it should work on Windows with something like [ansicon](http://github.com/adoxa/ansicon). Ruby 2.0 supposedly added support for ANSI on Windows. Because it supports multiple adapters, it should run on most Ruby implementations.

Oversetter is tested on the following Ruby versions:

- MRI 1.9.3
- MRI 2.1.4
- ~~Rubinius 2.2.10~~

### Synopsis

Search [Yandex](http://tech.yandex.com/translate/), [Hablaa](http://hablaa.com/api/), and [Glosbe](http://en.glosbe.com/a-api) from the command line. As Oversetter defaults are the same as Lyracyst defaults, see Lyracyst's page on [Defaults](http://github.com/weirdpercent/lyracyst/wiki/Defaults) for more info. Remember, the config file in ~/.oversetter.yml can be used to override the defaults. Get a Yandex API key as follows:

- Get an account at [Yandex](http://www.yandex.com)
- Get a translation API Key at [Yandex](http://tech.yandex.com/keys/get/?service=trnsl)

Put it in an environment variable YANDEX. Add it to .bashrc, .zshrc, Windows env, etc. This allows [TravisCI](http://www.travis-ci.org) to be used for continuous integration.

### Features

- Extensible
- JSON/XML parsing
- JSON/XML export
- Translations and detections from yandex.com
- Translations, examples, and similar translations from hablaa.com
- Translations and examples from glosbe.com
- Supports multiple HTTP clients with [httpi](http://github.com/savonrb/httpi)
- Supports multiple JSON parsers with [multi_json](http://github.com/intridea/multi_json)
- Supports multiple XML parsers with [multi_xml](http://github.com/sferik/multi_xml)

### Planned Features

- Input source text from STDIN
- Translations from [iTranslate4](http://itranslate4.eu/en/api/docs)
- Translations from [Frengly](http://www.frengly.com/#!/api)

### Usage

Please refer to the CLI documentation for all commands, options and defaults.

		gem install oversetter
		oversetter gl tr --src=eng --tar=spa hello
		oversetter ha tr --src=eng --tar=spa hello
		oversetter ya tr --lang=en-es hello
		oversetter --help
		oversetter help [command] [subcommand]

### Motivation

When I was developing [Lyracyst](http://github.com/weirdpercent/lyracyst), which is mainly for English, I wanted a similar tool for translation and transliteration. Oversetter is the result.

### Tests

Oversetter uses [Aruba](http://github.com/cucumber/aruba) and [Spinach](http://codegram.github.io/spinach/) to test commandline features. To test, just run:

    spinach

### Developers

		bundle install
		rake -T
		rake oversetter:yatr[hello]

### Contributing workflow

Here’s how we suggest you go about proposing a change to this project:

1. [Fork this project][fork] to your account.
2. [Create a branch][branch] for the change you intend to make.
3. Make your changes to your fork.
4. [Send a pull request][pr] from your fork’s branch to our `master` branch.

Using the web-based interface to make changes is fine too, and will help you
by automatically forking the project and prompting to send a pull request too.

[fork]: http://help.github.com/forking/
[branch]: https://help.github.com/articles/creating-and-deleting-branches-within-your-repository
[pr]: http://help.github.com/pull-requests/

### License

The MIT License (MIT)

**Copyright (c) 2015 Drew Prentice**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

**THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.**

### Gratitude

Many thanks to all contributors to the gems used in this project! And thanks to the creators and maintainers of the APIs that this tool consumes. Glosbe, Hablaa and Yandex are awesome!

Powered by [Hablaa](http://hablaa.com/)

Powered by [Yandex.Translate](http://translate.yandex.com)
