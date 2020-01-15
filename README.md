# README

## Requirements

- Git
- Python 3
- Ansible

## How to use

Firstly, install Ansible to your environment.

```bash
$ sudo -E apt install python3-pip
$ pip3 install --user ansible
```

## How to install softwares.

```bash
$ ./install/<role name>
```

For example.

```bash
$ ./install/nvim
```

## List of roles

| Name           | Desicription                                |
|:---------------|:--------------------------------------------|
| sudoers        | No password required for `sudo`.            |
| custom-scripts | Useful scripts for Linux.                   |
| coq            | Coq                                         |
| ctags          | ctags                                       |
| docker         | docker for Linux.                           |
| doxygen        | doxygen                                     |
| haskell        | ghci                                        |
| llvm           | llvm                                        |
| mono           | mono (non proxy)                            |
| nodejs         | Node.js and `n`                             |
| nvim           | Neovim and `.vim`                           |
| ocaml          | OCaml                                       |
| opam           | The package manager for OCaml.              |
| powershell     | PowerShell                                  |
| rbenv          | The ruby version manager for Ruby.          |
| review         | Re:View                                     |
| repo           | The multiple git repository tool by Google. |
| vscode         | Visual Studio Code and extensions |
