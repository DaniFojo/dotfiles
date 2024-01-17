if command -v bat &> /dev/null; then
  alias cat="bat -p" 
fi

if command -v eza &> /dev/null; then
  alias ls='eza'
  alias la='eza -a'
  alias ll='eza -lah'
  alias tree='eza --tree'
fi

if command -v nvim &> /dev/null; then
  alias vim="nvim" 
fi


