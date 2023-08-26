# custom aliases

## system
alias b="systemctl -i poweroff"
alias rb=reboot
alias wtf=fuck
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
