# Linux Install

```bash
git clone git@github.com:IQooLogic/nvim.git ~/.config/nvim --depth 1 && nvim
```

# Windows Install

```bash
git clone git@github.com:IQooLogic/nvim.git ~/.config/nvim --depth 1 && nvim
```

## zig compiler
https://ziglang.org/download/
> unzip and add to PATH

## stylua
https://github.com/JohnnyMorganz/StyLua/releases
> unzip and add to PATH if PATH not detected copy to C:\Users\iqool\AppData\Local\nvim

## lua-language-server
https://luals.github.io/#neovim-install
> unzip and add to PATH

## luarocks
```bash
$ sudo apt install python-is-python3
$ sudo apt install libreadline-dev
$ sudo apt install lua5.1
$ apt install liblua5.1-dev
luarocks --lua-version=5.1 config --local lua_dir /usr/bin
luarocks --lua-version=5.1 config --local variables.LUA_INCDIR /usr/include/lua5.1
```
http://luarocks.github.io/luarocks/releases
> unzip and add to PATH

## ripgrep
https://github.com/BurntSushi/ripgrep/releases
> unzip and add to PATH if PATH not detected copy to C:\Users\iqool\AppData\Local\nvim

## fd
https://github.com/sharkdp/fd/releases
> unzip and add to PATH if PATH not detected copy to C:\Users\iqool\AppData\Local\nvim

## pwsh.exe
https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4
> install pwsh with winget

## sed.exe
https://gnuwin32.sourceforge.net/packages/sed.htm
> unzip and add to PATH

## git
https://git-scm.com/download/win
> run installer

## font
https://www.nerdfonts.com/font-downloads
> download 'JetBrainsMono Nerd Font'
> unpack and install only 'JetBrainsMonoNLNerdFont'

## golang (gopls)
https://go.dev/doc/install
> run installer

### Go Tools
```bash
go install golang.org/x/tools/gopls@latest
go install github.com/onsi/ginkgo/ginkgo@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install golang.org/x/tools/cmd/gorename@latest
go install github.com/koron/iferr@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/josharian/impl@latest
go install github.com/davidrjenni/reftools/cmd/fillswitch@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/segmentio/golines@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/abenz1267/gomvp@latest
go install github.com/searKing/golang/tools/cmd/go-enum@latest
go install github.com/fatih/gomodifytags@latest
go install golang.org/x/tools/cmd/gonew@latest
go install gotest.tools/gotestsum@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/tmc/json-to-struct@latest
go install github.com/kyoh86/richgo@latest
go install github.com/golang/mock/mockgen@latest
go install mvdan.cc/gofumpt@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.55.2
go install golang.org/x/tools/cmd/callgraph@latest
go install github.com/shiba6v/reftools/cmd/fillstruct@latest
```

----------------------------------------------

# TODO
- dap
- run tests (go.nvim)
- git shortcuts
- git diff, merge, rebase
- better snippets
- better switching files (harpoon)
- todo support/search telescope
- add keymaps for screen split
- fast replacing text shortcuts
