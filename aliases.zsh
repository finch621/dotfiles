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
alias nv=nvim
alias nvm=nvim

## pnpm
alias pn=pnpm
alias px=pnpx

## dotnet override
alias dn=dotnet
alias dnn="dn new"
