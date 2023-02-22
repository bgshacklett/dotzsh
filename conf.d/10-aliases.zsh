alias ll="ls -lh"
alias k=kubectl
alias vi=nvim
alias :q=exit

# Accounting for PowerShell muscle memory
function ri() { printf "\a"; echo "wrong command" >&2; rm $@ }
alias ri=ri

alias rehist="fc -RI"
alias groovysh="groovysh -Djava.awt.headless=true"
alias git-nwadd="git diff -U0 -w -b --ignore-blank-lines --no-color | git apply --ignore-whitespace --unidiff-zero -"
alias isodate="date +"%Y-%m-%dT%H%M%S%z""
alias zisodate="date -u +"%Y-%m-%dT%H%M%SZ""
