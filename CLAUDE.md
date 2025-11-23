# CLAUDE.md - nvim-lumos

**Repository:** https://github.com/getlumos/nvim-lumos
**Ecosystem:** Part of LUMOS language tooling
**For ecosystem context:** See [lumos/CLAUDE.md](https://github.com/getlumos/lumos/blob/main/CLAUDE.md)

---

## What is nvim-lumos?

Neovim plugin for LUMOS schema language with Tree-sitter syntax highlighting and LSP integration.

**Status:** v0.1.0 development

---

## Quick Start

### Installation (lazy.nvim)

```lua
{
  "getlumos/nvim-lumos",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("lumos").setup()
  end,
}
```

### Installation (packer.nvim)

```lua
use {
  "getlumos/nvim-lumos",
  requires = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("lumos").setup()
  end,
}
```

---

## Key Files

- `ftdetect/lumos.lua` - File type detection for `.lumos` files
- `lua/lumos/init.lua` - Plugin entry point
- `lua/lumos/lsp.lua` - LSP configuration with keybindings
- `queries/lumos/highlights.scm` - Syntax highlighting queries (from tree-sitter-lumos)

---

## Features

**Automatic Features:**
- File type detection for `.lumos` files
- LSP integration with lumos-lsp server
- Tree-sitter syntax highlighting
- Format on save

**Default Keybindings:**
- `gd` - Go to definition
- `K` - Hover documentation
- `gr` - Find references
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions
- `<leader>f` - Format document

---

## Prerequisites

1. **Neovim 0.9+** (for Tree-sitter and LSP support)
2. **lumos-lsp** - LUMOS Language Server
   ```bash
   cargo install lumos-lsp
   ```
3. **nvim-treesitter** - Tree-sitter integration
4. **nvim-lspconfig** - LSP configuration framework

---

## Structure

```lua
-- lua/lumos/init.lua
local M = {}

function M.setup(opts)
  opts = opts or {}

  -- Setup LSP
  require('lumos.lsp').setup()

  -- Setup Tree-sitter if available
  local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
  if ok then
    ts_configs.setup({
      ensure_installed = { 'lumos' },
      highlight = { enable = true },
    })
  end
end

return M
```

---

## Dependencies

**Required:**
- Neovim 0.9+
- lumos-lsp (cargo install)
- nvim-treesitter
- nvim-lspconfig

**Related:**
- tree-sitter-lumos (syntax highlighting grammar)

---

## Troubleshooting

### LSP not starting

1. Verify lumos-lsp is installed:
   ```bash
   which lumos-lsp
   ```

2. Check LSP logs:
   ```vim
   :LspLog
   ```

3. Restart LSP:
   ```vim
   :LspRestart
   ```

### Syntax highlighting not working

1. Check Tree-sitter parser:
   ```vim
   :TSInstallInfo lumos
   ```

2. Reinstall parser:
   ```vim
   :TSInstall lumos
   ```

---

## AI Assistant Guidelines

**✅ DO:**
- Test LSP integration after changes
- Verify syntax highlighting works
- Keep keybindings consistent

**❌ DON'T:**
- Hardcode paths to lumos-lsp
- Skip testing with actual .lumos files
- Change default keybindings without good reason

---

**Last Updated:** 2025-11-23
**Full ecosystem docs:** [lumos/CLAUDE.md](https://github.com/getlumos/lumos/blob/main/CLAUDE.md)
