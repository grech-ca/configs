#!/usr/bin/env bash

source "./colors.sh"

CONFIGS_DIR="$HOME/repos/configs"
NVIM_DIR="$HOME/.config/nvim"

echo "${YELLOW}Creating the NeoVim config symlink...${NC}"
ln -sf "$CONFIGS_DIR/nvim" "$NVIM_DIR"

echo "${GREEN}Done!${NC}"
