#!/usr/bin/env bash
#
#
#
#
#                                       _
#                                      | |
#                    __ _ _ __ ___  ___| |__
#                   / _` | '__/ _ \/ __| '_ \
#                  | (_| | | |  __/ (__| | | |
#                   \__, |_|  \___|\___|_| |_|
#                    __/ |
#                   |___/
#
#
#                  Configurations repository of
#
#              Mikhail Grechka <grech.code@gmail.com>
#
#
#
#

#================================================================
# Variables
#================================================================

CONFIGS_DIR="$HOME/repos/configs"
NVIM_DIR="$HOME/.config/nvim"

cd "$CONFIGS_DIR"

#================================================================
# Sources
#================================================================

source "./scripts/colors.sh"

#================================================================
# Setup
#================================================================

echo "${YELLOW}Pulling the repository..."
git fetch && git pull

echo "${YELLOW}Creating the NeoVim config symlink...${NC}"
ln -sf "$CONFIGS_DIR/nvim" "$NVIM_DIR"

echo "${GREEN}Done!${NC}"
