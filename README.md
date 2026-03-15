# NeoVim Configuration

Some things will need to be manually installed for this `nvim` configuration to
work.

## Installing NeoVim (aka nvim)

The neovim Ubuntu packages prior to 22.04 are too old, as this configuration
requires neovim >= 0.10.0 (developed and tested with 0.10.4 at the time of this
writing).

* https://github.com/neovim/neovim/releases

The AppImage can still be used as noted below. Download the AppImage from the
NeoVim github releases link above.

I typically install the .deb package, but you can also install in `~/AppImages/`
like this:

    $ cd ~/AppImages
    $ curl -v <url-of-appimage-file>
    $ chmod 755 nvim.appimage
    $ mv nvim.appimage nvim-0.10.4.appimage
    $ ln -s nvim-0.10.4.appimage nvim
    $ ln -s nvim nv

After you have installed the language servers, you will need to have nvim
install all of the configured plugins. Fire up nvim and run the following:

    :Lazy   # Can use Update, Sync, etc commands, but should be automatic
    :qa

## Language Servers

The `Mason` plugin handles automatically loading and setup of Language servers
so following sections are probably no longer needed.

### Installing C/C++ Language Server

Need to install `clangd` LSP server with `apt install clangd`.

There are two ways to configure it in a project:

* Create a `compile_flags.txt` file at root of project.

  This is the easier of the two. Just add compiler flags, one per line, to the
  file. For example:

      $ cat compile_flags.txt
      -Wall
      -mcpu=cortex-m4
      -mfpu=fpv4-sp-d16
      -mfloat-abi=hard
      -mthumb
      -DUSE_HAL_DRIVER
      -DSTM32G474xx
      -ICore/Inc
      -IDrivers/STM32G4xx_HAL_Driver/Inc
      -IDrivers/STM32G4xx_HAL_Driver/Inc/Legacy
      -IDrivers/CMSIS/Device/ST/STM32G4xx/Include
      -IDrivers/CMSIS/Include

* Create a `compile_commands.json` file at root of project.

  This is more complicated.

  If you are using a CMake based project, then you can have CMake generate the
  file.

  For Makefile based projects, there are a couple of tools to try:

  + **Bear** (`apt install bear`):

        $ bear -- make all

  + **compiledb** (`pip install compiledb`):

        $ compiledb make

Using `ccls` used to work, but with the upgrade to `nvim-0.11.x` and upgrading
`nvim-lsp-config` it doesn't seem to work, hence have switched to using
`clangd`.

### Installing Python Language Server

This configuration uses the `python-language-server`:

* https://github.com/python-lsp/python-lsp-server

You will need to create a virtual environment with the needed packages
installed. I do the following:

    $ cat > setup.sh <<EOF
    #!/bin/bash
    python3 -m venv env
    source env/bin/activate
    pip install --upgrade pip
    pip install --upgrade -r requirements.txt
    EOF

    $ chmod 755 setup.sh

    $ cat > requirements.txt <<EOF
    python-lsp-server[yapf]
    Ropes
    Pyflakes
    pycodestyle
    YAPF
    EOF

    $ ./setup.sh
    ...

    $ source env/bin/activate
    $ nvim <some-python-file>

Navigating through python3 code should now work provided you start up `nvim`
in a shell that has activated the virtual environment.

TODO: There is supposedly a way to configure `nvim` to automatically load the
virtual environment, but I have not yet investigated how to do that.

### Installing Rust Language Server

Follow the installation instructions here:

* https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary

I put the binary in `~/.cargo/bin/` since that is already in my `$PATH`.

## Fuzzy File Finding

The `telescope` plugin allows finding files and greping through files. For it
to work, you need to install the following extra packages in the os (use apt):

* `ripgrep`
* `fd-find`

The key bindings to use it:

* `<leader>pf` : Find files within a project.
* `<C-p>`      : Find git files.
* `<leader>ps` : Grep files in project.

## Moving Selected Block

When a block is selected with `<Shift-v>`, you can now move it with:

* `K` : Move block up
* `J` : Move block down

The indent will change as needed while moving the block.

## Parsing Tools

Install tree-sitter-cli:

    $ cargo install tree-sitter-cli

## Checking NVIM installation

Start up nvim and run:

    :checkhealth
