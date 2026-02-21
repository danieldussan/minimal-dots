#!/bin/bash

# --- Colores ---
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

REPO_URL="https://raw.githubusercontent.com/danieldussan/minimal-dots/main"

echo -e "${BLUE}Iniciando setup desde minimal-dots...${NC}"

# 1. Limpieza total
rm -rf "$HOME/.oh-my-zsh"
rm -f "$HOME/.zshrc"
rm -f "$HOME/.p10k.zsh"

# 2. Instalación de Dependencias
if [ -f /etc/arch-release ]; then
  sudo pacman -S --noconfirm --needed zsh git curl wget
elif [ -f /etc/debian_version ]; then
  sudo apt-get update && sudo apt-get install -y zsh git curl wget
fi

# 3. Instalación de Oh My Zsh (Desatendido)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# 4. Plugins y Tema (Powerlevel10k y complementos)
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
echo -e "${BLUE}Instalando plugins y tema p10k...${NC}"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}"/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM}"/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}"/plugins/zsh-syntax-highlighting

# 5. Descargar TUS archivos de configuración desde el nuevo REPO
echo -e "${BLUE}Descargando .zshrc y .p10k.zsh desde tu repo...${NC}"
curl -fsSL "${REPO_URL}/.zshrc" -o ~/.zshrc
curl -fsSL "${REPO_URL}/.p10k.zsh" -o ~/.p10k.zsh

# 6. Cambiar Shell predeterminado
echo -e "${BLUE}Cambiando shell a ZSH...${NC}"
ZSH_PATH=$(which zsh)
sudo chsh -s "$ZSH_PATH" "$USER"

# 7. Preguntar si se quiere configurar para ROOT
echo -en "${BLUE}¿Deseas configurar este entorno también para el usuario ROOT? (s/n): ${NC}"
read -r response

if [[ "$response" =~ ^([sS][iI]|[sS]|[yY][eE][sS]|[yY])$ ]]; then
  echo -e "${BLUE}Configurando entorno para ROOT...${NC}"
  # Limpieza para root
  sudo rm -rf "/root/.oh-my-zsh"
  sudo rm -f "/root/.zshrc"
  sudo rm -f "/root/.p10k.zsh"

  # Instalación de Oh My Zsh para root
  sudo HOME=/root sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  # Plugins y Tema para root
  ROOT_ZSH_CUSTOM="/root/.oh-my-zsh/custom"
  sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ROOT_ZSH_CUSTOM}"/themes/powerlevel10k
  sudo git clone https://github.com/zsh-users/zsh-autosuggestions "${ROOT_ZSH_CUSTOM}"/plugins/zsh-autosuggestions
  sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ROOT_ZSH_CUSTOM}"/plugins/zsh-syntax-highlighting

  # Copiar configuración (puedes bajarlos de nuevo o copiarlos del usuario actual)
  sudo curl -fsSL "${REPO_URL}/.zshrc" -o /root/.zshrc
  sudo curl -fsSL "${REPO_URL}/.p10k.zsh" -o /root/.p10k.zsh

  # Cambiar shell de root
  sudo chsh -s "$ZSH_PATH" root
  echo -e "${GREEN}Entorno de ROOT configurado.${NC}"
else
  echo -e "${BLUE}Saltando configuración de ROOT.${NC}"
fi

echo -e "${GREEN}¡Todo listo! Sal de la sesión o escribe 'zsh' para empezar.${NC}"
