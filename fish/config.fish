set -g -x fish_greeting ''

abbr -a x 'exit'
abbr -a c 'clear'
abbr -a nv 'nvim'
abbr -a la 'ls -A'
abbr -a l 'ls -CF'

# some git abbreviations
abbr -a gs 'git status'                                                           
abbr -a gadd 'git add'                                                            
abbr -a gc 'git commit -m'
abbr -a gb 'git branch'

abbr -a python 'python3'
abbr -a pip 'pip3'

starship init fish | source

