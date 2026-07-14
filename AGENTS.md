<!-- Satellite context file — extends the global hub (~/.claude/CLAUDE.md | ~/.pi/agent/AGENTS.md). Host-neutral; project-specific only. Do not duplicate hub standards here. -->

# nvim-lumos

> Neovim plugin for the LUMOS schema language with Tree-sitter syntax highlighting and LSP integration.

**Ecosystem context:** See [getlumos/lumos/AGENTS.md](https://github.com/getlumos/lumos/blob/main/AGENTS.md) for the LUMOS ecosystem overview, cross-repo standards, and shared guidelines.

**Status:** v0.1.0 development

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

## Key Files

- `ftdetect/lumos.lua` - File type detection for `.lumos` files
- `lua/lumos/init.lua` - Plugin entry point
- `lua/lumos/lsp.lua` - LSP configuration with keybindings
- `queries/lumos/highlights.scm` - Syntax highlighting queries (from tree-sitter-lumos)

## Features

**Automatic:**
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

## Prerequisites

1. **Neovim 0.9+** (for Tree-sitter and LSP support)
2. **lumos-lsp** — LUMOS Language Server: `cargo install lumos-lsp`
3. **nvim-treesitter** — Tree-sitter integration
4. **nvim-lspconfig** — LSP configuration framework

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

## Dependencies

**Required:** Neovim 0.9+, lumos-lsp (cargo install), nvim-treesitter, nvim-lspconfig
**Related:** tree-sitter-lumos (syntax highlighting grammar)

## Troubleshooting

### LSP not starting
1. Verify `which lumos-lsp`
2. Check logs: `:LspLog`
3. Restart: `:LspRestart`

### Syntax highlighting not working
1. Check parser: `:TSInstallInfo lumos`
2. Reinstall parser: `:TSInstall lumos`