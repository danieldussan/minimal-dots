# 🚀 Minimal Dots - ZSH & Powerlevel10k Auto-Setup

Este repositorio contiene mis archivos de configuración personal (dotfiles) y un script de automatización para configurar un entorno de terminal productivo en sistemas basados en **Arch Linux** y **Debian/Ubuntu**.

## ✨ Características

- **Shell:** ZSH.
- **Framework:** Oh My Zsh.
- **Tema:** Powerlevel10k (configuración personalizada).
- **Plugins:** - `git`: Atajos para Git.
  - `sudo`: Presiona `Esc` dos veces para añadir sudo al comando anterior.
  - `zsh-autosuggestions`: Sugerencias basadas en tu historial.
  - `zsh-syntax-highlighting`: Resaltado de sintaxis en tiempo real.

## 🚀 Instalación rápida

Para configurar todo automáticamente en un usuario nuevo o existente, ejecuta el siguiente comando:

```bash
curl -fsSL https://raw.githubusercontent.com/danieldussan/minimal-dots/main/setup.sh | bash
```

> **Nota:** El script detectará tu distribución, instalará las dependencias necesarias, configurará Oh My Zsh, descargará los temas/plugins y establecerá ZSH como tu shell por defecto.

## 📦 Requisitos previos

Para que los iconos y símbolos se vean correctamente (especialmente en Powerlevel10k), se recomienda instalar una **Nerd Font**.

En **Arch Linux** puedes instalarla con:

```bash
sudo pacman -S ttf-fira-code ttf-nerd-fonts-symbols-common
```

## 🛠️ Estructura del Proyecto

- `.zshrc`: Configuración principal de ZSH y carga de plugins.
- `.p10k.zsh`: Configuración visual detallada del prompt.
- `setup.sh`: Script de automatización de instalación.

---

Hecho por [danieldussan](https://github.com/danieldussan)
