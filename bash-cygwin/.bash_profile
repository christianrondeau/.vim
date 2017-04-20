# Configure terminal with colors
export TERM=xterm-256color

# Configure common paths to use Windows versions of installed software
export PATH=${PATH}:"/cygdrive/c/WINDOWS/system32/WindowsPowerShell/v1.0"
export PATH=${PATH}:"$APPDATA/npm"

# Use Windows' GIT, but Cygwin's SSH
export VIM="C:/cygwin64/$HOME/.vim"
export GIT_CONFIG="C:/cygwin64/$HOME/.gitconfig"
export GIT_SSH="C:/cygwin64/bin/ssh.exe"
export GIT_EDITOR="C:/cygwin64/bin/vim.exe"

# Configure SSH agent
SSHAGENT=/usr/bin/ssh-agent
SSHAGENTARGS="-s"
if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
	eval `$SSHAGENT $SSHAGENTARGS`
	trap "kill $SSH_AGENT_PID" 0
fi
ssh-add $HOME/.ssh/id_rsa

# Configure often-used aliases
alias posh="powershell -File "
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend"
alias gp="git push"
alias gu="git pull"

# Configure GIT to use crlf everywhere but in ~/.vim
function git () {
    case "$PWD" in
        $HOME/.vim/*)
            command git -c core.autocrlf=false -c core.safecrlf=true -c core.eol=lf "$@"
            ;;
        *)
            command git "$@"
            ;;
    esac
}

# GIT auto complete
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi