# custom aliases

## system
alias b="systemctl -i poweroff"
alias rb=reboot
alias wtf=fuck
alias sup="sudo apt update"
alias sug="sudo apt upgrade"
if [[ $(uname) == 'Darwin' ]]; then
  alias b="sudo shutdown -h now"
fi

## neovim
if [[ -x $(command -v nvim) ]]; then
  alias nv=nvim
  alias nvm=nvim
fi

## pnpm
if [[ -x $(command -v pnpm) ]]; then
    alias pn=pnpm
    alias px=pnpx
fi

## dotnet override
if [[ -x $(command -v dotnet) ]]; then
  alias dn=dotnet
  alias dnn="dn new"
fi
