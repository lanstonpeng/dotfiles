# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
#ZSH_THEME="miloshadzic"
#ZSH_THEME="gnzh"
#ZSH_THEME="prose"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx autojump tmux)

source $ZSH/oh-my-zsh.sh
# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
export CLICOLOR=1;
export LSCOLORS=GxFxCxDxBxegedabagaced
export TERM=xterm-256color
export EDITOR=vim

alias  gvim='~/Desktop/MacVim.app/Contents/MacOS/MacVim '
alias  fuckgfw="python ~/Desktop/goagent/local/proxy.py"
alias  totux="ssh lanstonpeng@222.200.98.151"
alias  cleanzsh='sudo rm /private/var/log/asl/*.asl'
alias  c='pygmentize -O style=monokai -f console256 -g'
alias  extract="dtrx"
#alias  suckPD="sudo rm /Library/Preferences/Parallels/licenses.xml"
alias  vi="vim"
alias  z="cd"

# View HTTP traffic
 alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
 alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

#alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$HOME/bin:$PATH
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"

#for adb
PATH=$PATH:/Users/lanstonpeng/Downloads/adt-bundle-mac-x86_64-20131030/sdk/platform-tools
# for wandoujia
#export M2_HOME=/usr/share/java/maven-3.0.3
#export M2=$M2_HOME/bin
#export PATH=$M2:$PATH
#alias resuckapache="sudo /opt/local/apache2/bin/apachectl restart"
#alias suckapache="sudo /opt/local/apache2/bin/apachectl start"
#alias buildmms="mvn install -pl mms-webapp -Denv=debug -am -Dmaven.test.skip=true"
#alias tostyle="cd /Users/lanstonpeng/mms/mms-webapp/src/main/webapp/style"
#alias totemplate="/Users/lanstonpeng/mms/mms-webapp/src/main/webapp/WEB-INF/templates"
#alias startmms="cd /Users/lanstonpeng/mms/mms-webapp;mvn jetty:run"

# for mysql
export PATH=/usr/local/mysql/bin:$PATH
#for speeding
alias speedup="sudo rm /var/log/asl/*.asl;"
alias cpcur="pwd | pbcopy"
alias tocur="cd `pbpaste`"

sh ~/shell/startTmux.sh
#for tech|useful
alias whatip="curl ifconfig.me"
alias pyserver="python -m SimpleHTTPServer"
alias showmebaby="vim ~/Dropbox/githubs/dotFile/useful.md"
alias grep='grep --exclude-dir=".svn"'

function grp(){
    grep -rIn  --exclude-dir="\.svn" $1 *;
}

function svn {
  # Skip the color script when running an svn commit.
  if [ "x$1" = "xci" ] || [ "x$1" =  "xcommit" ] || [ "x$1" = "xadd" ]
  then
    command svn "$@";
    return;
  fi
 
  # Pipe svn through awk to colorize its output.
  command svn "$@" | awk '
  BEGIN {
    cpt_c=0;
  }
  {
    if        ($1=="C") {
      cpt_c=cpt_c+1;
      print "\033[31m" $0 "\033[00m";  # Conflicts are displayed in red
    }
    else if   ($1=="M") {
      print "\033[31m" $0 "\033[00m";  # Modified in red
    }
    else if   ($1=="A") {
      print "\033[32m" $0 "\033[00m";  # Add in green
    }
    else if   ($1=="?") {
      print "\033[36m" $0 "\033[00m";  # New in cyan
    }
    else if   ($1=="D") {
      print "\033[31m" $0 "\033[00m";  # Delete in red
    }
    else if   ($1=="U") {
      print "\033[35m" $0 "\033[00m";  # Updated in light magenta
    }
    else if   ($1=="X") {
      print "\033[33m" $0 "\033[00m";  # No changes in yellow.
    }
    else if   ($1=="At" || $1 == "External") {
      print "\033[33m" $0 "\033[00m";  # Revision numbers in brown.
    }
    else                {
      print $0;                        # No color, just print the line
    }
  }
  END {
    print cpt_c, " conflicts are found.";
  }';
}
