# AGENTS.md - dotfiles

Hola, antes de empezar a trabajar con el repositorio personal del usuario `Usergh0st` es buena práctica leer este archivo antes de realizar cualquier acción o paso.

## Índice

Con este indice puedes navegar rapido hacia los temas sin perder tiempo. Si notas que falta algun tema o cuestion por mencionar en `AGENTS.md` propon actualizar el archivo con el tema faltante.

- [¿Qué son los dotfiles?](#qué-son-los-dotfiles)
- [Propósito general](#propósito-general)
- [Commits](#commits)
- [CHANGELOG.md](#changelogmd)
- [Estructura del repositorio](#estructura-del-repositorio)
  - [1. Árbol de `~/.config`](#1-árbol-de-config)
  - [2. Árbol de la raíz `~/dotfiles`](#2-árbol-de-la-raíz-homdotfiles)
- [Cómo usar este repositorio](#cómo-usar-este-repositorio)
- [Requisitos y dependencias](#requisitos-y-dependencias)
  - [Kali Linux / Debian](#kali-linux--debian)
  - [Arch Linux / Manjaro](#arch-linux--manjaro)
- [Recomendaciones generales](#recomendaciones-generales)
- [Memoria persistente](#memoria-persistente)
- [Guía del repositorio](#guía-del-repositorio)
- [Enlaces y documentación web externa](#enlaces-y-documentación-web-externa)

## ¿Qué son los dotfiles?

Un repositorio de **dotfiles** es una colección personal de archivos de configuración que suelen empezar con un punto (`.`). Ejemplos:

- `.zshrc` — Archivo personal de configuración de zsh.
- `.xinitrc` — Archivo personal que inicia el entorno bspwm con variables de entorno.
- `.zprofile` — Determina qué entorno de escritorio se usa (bspwm o hyprland).
- `.p10k.zsh` — Configuración de Powerlevel10k.

## Propósito general

Dentro de este repositorio, el trabajo principal es documentación y, de vez en cuando, trabajar con código si el usuario lo solicita o requiere ayuda.

El idioma que se maneja para la documentación es el **Inglés**, así que cualquier cosa que documentes usa el idioma mencionado anteriormente.

**Nota sobre el idioma:** este archivo `AGENTS.md` está escrito en español porque sirve como contexto para modelos de IA. Sin embargo, el resto de la documentación del repositorio (`CHANGELOG.md`, `README.md`, mensajes de commit, código y comentarios) debe estar en **Inglés**.

Segundo propósito general: crear los commits en el repositorio usando **conventional commits**.

Archivos clave de documentación:

- `CHANGELOG.md`
- `README.md`

Regla: si notas que el árbol está desactualizado o incompleto, resáltalo al usuario y propone actualizar el árbol con todos los archivos actuales.

Nota: la lectura de `CHANGELOG.md` y `README.md` es opcional si no resulta necesaria; evita leer esos archivos a menos que tengas que trabajar con ellos.

## Commits

Este repositorio utiliza **conventional commits** para mantener un historial claro y consistente. La rama principal siempre sera **master** no hay otras ramas solo esta, repositorio remoto configurado en Github listo para hacer push.

Nota: no hagas commit sin permiso del usuario.

### Formato

```
tipo(alcance): descripción
```

Donde:

- **tipo** — indica el tipo de cambio. Los más usados en este repositorio son:
  - `feat` — nueva funcionalidad o archivo de configuración nuevo.
  - `fix` — corrección de un error o problema.
  - `update` / `refactor` — cambios que no añaden funcionalidad ni corrigen errores (mejoras, reordenado, limpieza).
  - `remove` — eliminación de archivos o configuraciones.
- **alcance** — el archivo o área afectada, entre paréntesis (por ejemplo: `nvim`, `hyprland`, `README.md`, `.zshrc`).
- **descripción** — resumen breve del cambio, en minúscula y sin punto final.

### Ejemplos reales del repositorio

```text
feat: new nvim configuration files
update(nvim): new configuration have been updated
fix(sxhkdrc): workspaces 7 and 8 were made available
refactor: fixing minor errors + add polkit agent + env variables
remove: alacritty old config files
feat(.zshrc & .p10k.zsh): some improvements and performance
```

### Recomendación

Antes de hacer un commit, revisa los commits anteriores para familiarizarte con el estilo usado:

```bash
git log --oneline -20
```

## CHANGELOG.md

Cuando documentes cambios en este repositorio, usa la **misma estructura que `CHANGELOG.md`** para que el historial sea consistente y fácil de leer.

Nota: antes de editar `CHANGELOG.md`, propón los cambios que vas a realizar o añadir. Si el usuario los aprueba, aplícalos; de lo contrario, no hagas nada. Aplica la misma regla a `README.md`.

Cada entrada debe incluir:

1. **Título del cambio** — una breve descripción de qué se hizo (ejemplo: `Latest changes and summary of what has been done.`).
2. **Fecha** — en formato `##### Weekday DD Month YYYY` (ejemplo: `##### Wednesday 22 April 2026`).
3. **### New** — cosas nuevas añadidas (archivos, scripts, configuraciones, etc.).
4. **### Changes** — cambios realizados sobre lo existente (refactor, correcciones, ajustes).
5. **### Previews** — imágenes o capturas del entorno, si aplica.
6. **### To-Do** — próximos pasos a realizar dentro del repositorio, usando **checkboxes**:
   - `- [ ]` para tareas pendientes.
   - `- [x]` para tareas completadas.

Ejemplo de To-Do:

```text
### To-Do

- [x] New hyprland desktop
- [ ] Configure the Dunst notification daemon.
- [ ] Create the installer for Arch-based distributions.
```

Ejemplo completo de entrada:

```text
## Título del cambio

##### Wednesday 22 April 2026

### New

- Descripción de lo nuevo añadido.
    - [commit](https://github.com/Usergh0st/dotfiles/commit/xxxx)

### Changes

- Cambios realizados sobre lo existente.
    - [commit](https://github.com/Usergh0st/dotfiles/commit/xxxx)

### Previews

Descripción de la vista previa.

- ![alt text](enlace-imagen)

### To-Do

- [x] Tarea completada
- [ ] Tarea pendiente
```

Se aceptan siempre sugerencias de mejora. Si notas algo que se pueda optimizar o añadir, propónlo al usuario.

---

## Estructura del repositorio

El repo se divide en dos partes principales:

1. **Configuraciones de `~/.config`** — aplicaciones y entornos de escritorio.
2. **Raíz de `~/dotfiles`** — scripts instaladores, fuentes, documentación y archivos sueltos.

Los árboles reflejan la estructura actual del repositorio. El contenido de `home/.config` se detalla en la primera sección.

### 1. Árbol de `~/.config`

```bash
.
├── alacritty
│   ├── bspwm
│   │   ├── alacritty.toml
│   │   ├── colorsheme.toml
│   │   └── fonts.toml
│   └── hyprland
│       ├── alacritty.toml
│       ├── colorsheme.toml
│       └── fonts.toml
├── bspwm
│   ├── assets
│   │   ├── rofi.png
│   │   └── webp.png
│   ├── bspwmrc
│   ├── picom
│   │   ├── picom-animations-with-physical-hardware.conf
│   │   ├── picom-machines-virtuals.conf
│   │   └── picom-physical-hardware.conf
│   ├── polybar
│   │   ├── barpwn
│   │   │   ├── config.ini
│   │   │   ├── launch.sh
│   │   │   └── modules.ini
│   │   └── homebar
│   │       ├── config.ini
│   │       ├── launch.sh
│   │       └── modules.ini
│   ├── rofi
│   │   ├── powermenu.rasi
│   │   ├── shared.rasi
│   │   ├── style-1.rasi
│   │   ├── style-2.rasi
│   │   └── style-3.rasi
│   ├── src
│   │   ├── CustomResolution.sh
│   │   ├── ExternalRules.sh
│   │   ├── KaliUpdates.sh
│   │   ├── MonitorSetup.sh
│   │   ├── OpenApps.sh
│   │   ├── powermenu.sh
│   │   ├── Resize.sh
│   │   ├── target.sh
│   │   ├── Term.sh
│   │   ├── VPN.sh
│   │   └── WallSelect.sh
│   ├── sxhkdrc
│   ├── system.ini
│   └── walls
│       ├── Evangelion.png
│       └── Skyline.png
├── hypr
│   ├── autostart.conf
│   ├── hyprland.conf
│   ├── keybinds.conf
│   ├── monitors.conf
│   ├── programs.conf
│   └── walls
│       ├── BloodnSpice.png
│       ├── PinkLinux.png
│       └── PinkSkull.png
├── nvim
│   ├── init.lua
│   └── lua
│       ├── lazy_nvim.lua
│       ├── nvim-options.lua
│       └── plugins
│           ├── alpha.lua
│           ├── colorsheme.lua
│           ├── mini-hipatterns.lua
│           ├── mini-pairs.lua
│           ├── smear_cursor.lua
│           └── treesitter.lua
└── systemd
    └── user
        ├── ArchUpdates.service
        ├── ArchUpdates.timer
        ├── battery-threshold.service
        ├── KaliUpdates.service
        ├── KaliUpdates.timer
        ├── polybar-update.path
        └── polybar-update.service
```

### 2. Árbol de la raíz `~/dotfiles`

```bash
.
├── .github
│   └── FUNDING.yml
├── AGENTS.md
├── ArchInstaller.sh
├── CHANGELOG.md
├── home
│   ├── .config
│   │   ├── alacritty
│   │   ├── bspwm
│   │   ├── hypr
│   │   ├── nvim
│   │   └── systemd
│   ├── .p10k.zsh
│   ├── .xinitrc
│   ├── .zprofile
│   ├── .zshrc
│   └── fonts
│       ├── BaiJamjuree-Regular.ttf
│       ├── ComicMono.ttf
│       ├── CozetteVectorNerdFont.ttf
│       ├── FontAwesome6-Free-Solid.otf
│       ├── HackNerdFont-Regular.ttf
│       ├── iosevka_nerd_font.ttf
│       ├── JetBrains_Mono_NL_Regular.ttf
│       ├── MaterialDesignIconsDesktop.ttf
│       ├── MesloLGS
│       │   ├── 'MesloLGS NF Bold.ttf'
│       │   ├── 'MesloLGS NF Bold Italic.ttf'
│       │   ├── 'MesloLGS NF Italic.ttf'
│       │   └── 'MesloLGS NF Regular.ttf'
│       ├── Minecraft
│       │   ├── Minecraft_Medium.ttf
│       │   ├── Minecrafter_Alt_Regular.ttf
│       │   ├── Minecraftia_Regular.ttf
│       │   ├── Minercraftory_Regular.ttf
│       │   ├── Monocraft-SemiBold.ttf
│       │   └── Monocraft_Regular.ttf
│       ├── RuneScape_UF_Regular.ttf
│       ├── SajaTypeworks
│       │   ├── Cascadia_Mono_Regular_VF_[wght].ttf
│       │   ├── CascadiaCode.ttf
│       │   ├── CascadiaCodeBold.ttf
│       │   ├── CascadiaCodeItalic.ttf
│       │   └── CaskaydiaCoveNerdFontMono-Regular.ttf
│       └── scientifica
│           ├── scientifica.ttf
│           ├── scientificaBold.ttf
│           └── scientificaItalic.ttf
├── KaliInstaller.sh
├── LICENSE
├── MEMORY.md
├── misc
│   ├── archfetch.sh
│   ├── asciiart
│   │   └── usergh0st
│   ├── colorscript.sh
│   ├── confd
│   │   ├── 30-touchpad.conf
│   │   ├── 99-swappiness.conf
│   │   ├── 99local
│   │   └── local.conf
│   ├── firefox
│   │   └── user.js
│   └── kalifetch.sh
└── README.md
```

## Cómo usar este repositorio

Este repositorio contiene configuraciones personales. Si vas a aplicarlas en tu propio sistema:

1. **Revisa antes de copiar** — no todas las rutas o variables de entorno coincidirán con tu máquina.
2. **Scripts de instalación** — se encuentran en la raíz:
   - `ArchInstaller.sh` — instalador/configuración para Arch Linux.
   - `KaliInstaller.sh` — instalador/configuración para Kali Linux.
   - `misc/archfetch.sh` — script de información del sistema (fetch) para Arch.
   - `misc/kalifetch.sh` — script de información del sistema (fetch) para Kali.
   - `misc/colorscript.sh` — script para mostrar colores/ASCII art.
   > Los scripts dentro de `misc/` son de carácter misceláneo y sirven principalmente para mejorar la apariencia del entorno; aún no se han implementado por completo.
3. **Fuentes** — las tipografías están en `home/fonts/` y deben instalarse en el sistema para que se vean correctamente.
4. **systemd de usuario** — los archivos en `systemd/user/` son unidades de systemd para el usuario actual (`--user`).

## Requisitos y dependencias

Los paquetes necesarios se instalan automáticamente mediante los scripts de la raíz del repositorio. A continuación se muestran los principales por distribución:

### Kali Linux / Debian (`KaliInstaller.sh`)

- **Entorno de escritorio y utilidades:** `polybar`, `rofi`, `alacritty`, `zsh`, `git`, `wget`, `curl`, `net-tools`, `xdotool`, `pulseaudio`, `pavucontrol`, `fzf`, `fastfetch`, `papirus-icon-theme`, `adwaita-icon-theme`, `bat`, `firefox-esr`, `openvpn`, `bleachbit`, `mousepad`, `feh`, `eza`, `xclip`, `zoxide`, `polkit-gnome`
- **Servidor gráfico:** `xserver-xorg-core`, `xserver-xorg-video-fbdev`, `xserver-xorg-input-all`, `x11-xserver-utils`, `xinit`, `xinput`
- **Dependencias de compilación (bspwm, sxhkd, picom):** `build-essential`, `meson`, `ninja-build`, `pkg-config`, `libconfig-dev`, `libdbus-1-dev`, `libegl-dev`, `libev-dev`, `libepoxy-dev`, `libpcre2-dev`, `libpixman-1-dev`, `uthash-dev`, y varias librerías `libxcb-*`

### Arch Linux / Manjaro (`ArchInstaller.sh`)

- **Entorno de escritorio y utilidades:** `rofi`, `feh`, `polybar`, `neovim`, `git`, `fastfetch`, `net-tools`, `eza`, `bat`, `python-pywal`, `less`, `fzf`, `thunar`, `firefox`, `rustup`, `xclip`, `papirus-icon-theme`
- **Servidor gráfico:** `xorg-xrandr`, `xorg-server`, `xorg-xinit`, `xorg-xsetroot`, `xorg-xinput`
- **Dependencias generales:** `base-devel`, `brightnessctl`, `xdotool`, `xsettingsd`, `zsh`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `curl`
- **Hyprland / Wayland:** `noto-fonts-emoji` (además de las anteriores)

> Ambos scripts también clonan repositorios externos (bspwm, sxhkd, picom, powerlevel10k, fzf-tab, etc.) y requieren permisos de root/sudo.

## Recomendaciones generales

- Antes de hacer cambios importantes, haz una copia de seguridad o crea una rama.
- Si añades una nueva aplicación a `~/.config`, documenta brevemente su propósito aquí en el `AGENTS.md`.
- Los nombres de archivo y rutas pueden contener caracteres especiales o espacios (por ejemplo, en las fuentes de MesloLGS); usa comillas al manipularlos desde la terminal.

## Memoria persistente

- Al empezar, es importante leer `MEMORY.md` para conocer el estado actual del proyecto y las decisiones tomadas.
- Al terminar una tarea, actualiza esta memoria con el estado actual, las decisiones importantes **y sus motivos**, además de los errores a evitar.
- Si algo se convierte en una regla permanente, propón moverlo a `AGENTS.md` en lugar de dejarlo en la memoria.
- Nunca guardes datos sensibles, como secretos, tokens, claves de API o datos personales.
- Mantenlo breve (máximo ~250 líneas): resume o elimina lo que ya no sirva o aporte.

## Guía del repositorio

> `https://github.com/gh0stzk/dotfiles.git` — repositorio muy útil como referencia.

- En el repositorio del usuario `gh0stzk` se encuentran configuraciones personales de bspwm bastante increíbles. Usa este repositorio de referencia para proponer mejoras y correcciones, o simplemente como documentación.
- Es útil para proponer funcionalidades que aún no se hayan implementado en estos dotfiles.
- También es útil para tener una referencia clara.

## Enlaces y documentación web externa

Nota: no intentes investigar ni buscar estos enlaces por el momento, a menos que necesites consultar documentación o el usuario te pida información sobre algún concepto como **polybar** o **alacritty**.

> `https://archlinux.org/` — A simple, lightweight distribution.
> `https://github.com/polybar/polybar` — A fast and easy-to-use status bar.
> `https://alacritty.org/config-alacritty.html` — A cross-platform, OpenGL terminal emulator.

- Útil para documentar y saber exactamente cómo funciona un software específico.
- Actualmente se tienen tres enlaces. A medida que vayas trabajando con el repositorio y detectes software que se esté usando, actualiza esta sección agregando más enlaces de documentación.

---

Última actualización: revisa el `CHANGELOG.md` para ver el historial de cambios del repositorio.
