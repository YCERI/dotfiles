TSIZE=10000
HISTFILESIZE=20000

# Evitar duplicados y comandos con espacio al inicio
HISTCONTROL=ignoreboth

# Agregar timestamp a cada comando (como en Kali)
HISTTIMEFORMAT="%F %T "

# Guardar historial inmediatamente (no solo al cerrar sesión)
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Ignorar comandos repetidos y triviales
HISTIGNORE="ls:ll:cd:pwd:clear:history"

# ~/.bashrc - Brutal Hacker Edition 🚀
echo "hello master...working...."
# FASTFETCH
if command -v fastfetch &> /dev/null; then
    fastfetch
fi

# ⚠️ SONIDO DE ENTRADA (opcional, si tienes `canberra-gtk-play`)
# canberra-gtk-play -f /usr/share/sounds/freedesktop/stereo/desktop-login.oga &> /dev/null &

# 🔥 MENSAJE DE BIENVENIDA
echo -e "\e[1;32m"
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃  🧠 WELCOME BACK — SYSTEM ARMING...         ┃"
echo "┃  🕶️  Mode: BRUTAL HACKER                    "┃
echo "┃  🔐 $(whoami)@$(hostname) — $(date '+%H:%M:%S · %d/%m/%Y')"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo -e "\e[0m"

# 💀 PROMPT PERSONALIZADO MATRIX
export PS1='\[\e[1;32m\]M\[\e[1;31m\]Á\[\e[1;32m\]T\[\e[1;31m\]R\[\e[1;32m\]I\[\e[1;31m\]X\[\e[1;32m\] \[\e[5;31m\]💀\[\e[0m\] \[\e[1;36m\]\u\[\e[1;32m\]@\[\e[1;33m\]\h\[\e[1;32m\]:\[\e[1;35m\]\w\[\e[1;31m\] ▶▶▶\[\e[0m\] '

# 🧠 ALIASES PODEROSOS
alias cls='clear'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias update='sudo dnf upgrade --refresh -y'
alias please='sudo $(fc -ln -1)'
alias hacker='echo "🧠 Ejecutando scripts ocultos..."'
alias x='exit'
alias py='python3'
alias ports='netstat -tulanp'
alias ipinfo='curl ifconfig.me && echo && curl ipinfo.io'

# 🔎 GIT ALIASES
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'
alias ga='git add .'
alias gb='git branch'

# 🧠 HISTORIAL
HISTSIZE=10000
HISTFILESIZE=20000

# 🌈 GREP Y MAN CON COLORES
export GREP_OPTIONS='--color=auto'
export LESS='-R'

# 🌐 PATH CUSTOM (si necesitas añadir rutas)
# export PATH=$PATH:$HOME/.scripts

# 🧙 STARSHIP (si lo instalas)
# if command -v starship &> /dev/null; then
#     eval "$(starship init bash)"
# fi

export GRADLE_HOME=/opt/gradle
export PATH=$PATH:$GRADLE_HOME/bin



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export JAVA_HOME=/usr/lib/jvm/java-25-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
# Tamaño del historial
HISTSIZE=10000
HISTFILESIZE=20000

# Evitar duplicados y comandos con espacio al inicio
HISTCONTROL=ignoreboth

# Agregar timestamp a cada comando (como en Kali)
HISTTIMEFORMAT="%F %T "

# Guardar historial inmediatamente (no solo al cerrar sesión)
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Ignorar comandos repetidos y triviales
HISTIGNORE="ls:ll:cd:pwd:clear:history"

# Asegurarse de que el historial se añada, no sobrescriba
shopt -s histappend

shopt -s histappend
eval "$(atuin init bash)"
[[ ${BLE_VERSION-} ]] && ble-attach

# opencode
export PATH=$HOME/.opencode/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
export JAVA_HOME=/usr/lib/jvm/java-25-openjdk
export PATH=$JAVA_HOME/bin:$PATH

alias fastfetch="fastfetch --logo apple"
