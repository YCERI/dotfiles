#!/usr/bin/env bash
# setup.sh — Fedora + KDE Plasma reproducible (SevenTech 2026)
# Idempotente: se puede correr varias veces sin romper nada.
# Uso: DOTFILES_REPO=https://github.com/YCERI/dotfiles.git ./setup.sh
set -euo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/YCERI/dotfiles.git}"
DOTFILES_DIR="$HOME/dotfiles"

DNF_PKGS=(git stow neovim tmux htop fastfetch ripgrep fd-find bat yakuake toolbox flatpak)
FLATPAKS=(com.github.tchx84.Flatseal org.telegram.desktop)
STOW_PKGS=(kde shell)          # carpetas dentro del repo de dotfiles

log() { printf '\n\033[1;34m==> %s\033[0m\n' "$*"; }

[ "$(id -u)" -ne 0 ] || { echo "No lo corras como root."; exit 1; }

log "1/6 Ajustes de dnf"
for line in "max_parallel_downloads=10" "defaultyes=True"; do
  key="${line%%=*}"
  grep -q "^${key}=" /etc/dnf/dnf.conf || echo "$line" | sudo tee -a /etc/dnf/dnf.conf >/dev/null
done

log "2/6 RPM Fusion"
if ! rpm -q rpmfusion-free-release >/dev/null 2>&1; then
  sudo dnf install -y \
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm" \
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
fi

log "3/6 Paquetes (dnf)"
sudo dnf install -y "${DNF_PKGS[@]}"

log "4/6 Apps (flatpak)"
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user -y --noninteractive flathub "${FLATPAKS[@]}"

log "5/6 Dotfiles"
if [ -d "$DOTFILES_DIR/.git" ]; then
  git -C "$DOTFILES_DIR" pull --ff-only
else
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi
# Respaldar archivos reales que estorben a stow
for f in .config/kdeglobals .config/kwinrc .config/kglobalshortcutsrc .config/konsolerc .config/plasmarc .bashrc; do
  if [ -e "$HOME/$f" ] && [ ! -L "$HOME/$f" ]; then
    mv "$HOME/$f" "$HOME/$f.bak.$(date +%s)"
  fi
done
stow -d "$DOTFILES_DIR" -t "$HOME" --restow "${STOW_PKGS[@]}"

log "6/6 Tema y ajustes de Plasma"
kwriteconfig6 --file kdeglobals --group KDE --key SingleClick false
if [ -n "${WAYLAND_DISPLAY:-}${DISPLAY:-}" ]; then
  plasma-apply-lookandfeel -a org.kde.breezedark.desktop || true
fi

log "Listo ✔  Cierra sesión y vuelve a entrar para aplicar todo."
