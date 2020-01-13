#!/bin/bash
#////////// require
cd `dirname $0`
ESC=$(printf '\033')
if [ "${ZSH_VERSION:-}" ] || [ "${KSH_VERSION:-}" ]; then
  puts() { IFS=" $IFS"; print -nr -- "${*:-}"; IFS=${IFS# }; }
elif [ "${POSH_VERSION:-}" ]; then
  puts() {
    [ $# -eq 0 ] && return 0
    IFS=" $IFS"; set -- "$*"; IFS=${IFS# }
    [ "$1" = -n ] && echo -n - && echo -n n && return 0
    local IFS='\'; set -- $1
    [ $# -gt 0 ] && echo -n "$1" && shift
    while [ $# -gt 0 ]; do echo -n "\\\\$1" && shift; done
  }
else
  puts() { printf '%s' "$*"; }
fi
putsn() { IFS=" $IFS"; puts "${*:-}$LF"; IFS=${IFS# }; }

if !(type "ruby" > /dev/null 2>&1); then
  putsn "${ESC}[31mPlease install ruby.${ESC}[m"
  exit 1
fi
#rake
if !(type "rake" > /dev/null 2>&1); then
  echo -n "Install rake [Y/n]: "
  read ANS
  case $ANS in
    "" | [Yy]* )
    sudo gem install rake
    ;;
    * )
    putsn "${ESC}[31mPlease install rake.${ESC}[m"
    exit 1
    ;;
  esac
fi
if !(type "bundle" > /dev/null 2>&1); then
  echo -n "Install bundle [Y/n]: "
  read ANS
  case $ANS in
    "" | [Yy]* )
    sudo gem install bundler
    ;;
    * )
    putsn "${ESC}[31mPlease install bundle.${ESC}[m"
    exit 1
    ;;
  esac
fi

# ------------------------------version---
if [ "$(uname)" == 'Darwin' ]; then #macOs
  if [ "$(ruby -e "puts Gem::Version.create('$(sw_vers -productVersion)') >= Gem::Version.create('10.15')")" == 'true' ]; then # catalina or later
    cp rake/Rakefile_macos_catalina_or_later Rakefile
  elif [ "$(ruby -e "puts Gem::Version.create('$(sw_vers -productVersion)') >= Gem::Version.create('10.15')")" == 'false' ]; then # macOS
    cp rake/Rakefile_mac Rakefile
  else
    putsn "${ESC}[31mYour platform (Mac $(sw_vers -productVersion)) is not supported.${ESC}[m"
    exit 1
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then # linux
  cp rake/Rakefile_linux Rakefile
else
  putsn "${ESC}[31mYour platform ($(uname -a)) is not supported.${ESC}[m"
  exit 1
fi

putsn "${ESC}[32mSuccessfully!${ESC}[m"
