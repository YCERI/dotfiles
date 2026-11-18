# dotfiles

Configuración personal para **Fedora + KDE Plasma 6**, gestionada con
[GNU Stow](https://www.gnu.org/software/stow/). El repositorio acompaña a
`setup.sh`, que instala los paquetes y aplica estos dotfiles de forma
reproducible.

## Uso

Clona el repositorio y entra en él:

```bash
git clone https://github.com/YCERI/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Modo rápido (por defecto): instala los paquetes base y omite las apps de
Flatpak:

```bash
./setup.sh
```

Modo completo (`FULL=1`): agrega los paquetes extra y las apps de Flatpak:

```bash
FULL=1 ./setup.sh
```

El script clona este repositorio en `~/dotfiles` (o hace `git pull` si ya
existe) y luego aplica los paquetes de Stow `kde` y `shell` sobre `$HOME`.

Para aplicarlo manualmente sin ejecutar todo el setup:

```bash
stow -d ~/dotfiles -t "$HOME" --restow kde shell
```

## Estructura

```
dotfiles/
├── kde/
│   └── .config/
│       ├── kdeglobals
│       ├── kglobalshortcutsrc
│       ├── konsolerc
│       ├── kwinrc
│       └── plasmarc
├── shell/
│   └── .bashrc
├── setup.sh
├── .gitignore
└── README.md
```

Los paquetes de Stow replican la ruta relativa a `$HOME`: por ejemplo,
`kde/.config/kwinrc` se enlaza en `~/.config/kwinrc` y `shell/.bashrc` en
`~/.bashrc`.

## Notas

- No se incluyen tokens, contraseñas ni rutas personales.
- Los wallpapers concretos no se versionan; Plasma usará el fondo por defecto.
- Los archivos que ya existan en `$HOME` se respaldan como `*.bak.<timestamp>`
  antes de aplicar Stow.
