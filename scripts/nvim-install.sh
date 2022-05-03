CONFIGS_DIR="$HOME/repos/configs"
NVIM_DIR="$HOME/.config/nvim"

cd "$CONFIGS_DIR"

source "./scripts/colors.sh"

git clone --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"

echo "${YELLOW}Pulling the repository..."
git fetch && git pull

echo "${YELLOW}Creating the NeoVim config symlink...${NC}"
ln -sf "$CONFIGS_DIR/grech-nvim" "$NVIM_DIR"

if ! command -v "lazygi"; then
  echo "WARNING: ${YELLOW}LazyGit is not installed!"
fi

echo "${GREEN}Done!${NC}"
