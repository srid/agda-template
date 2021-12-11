# Agda project template using Nix

WIP

```
nix develop -c agda -v 2 src/hello.agda
```

## VSCode

- Run "Agda: Load" command followed by "Agda: Compile" in `hello.agda` to sanity-check the environment.

## Tasks

- [x] Fix `error: a 'x86_64-darwin' with features {} is required to build` on m1 macOS
- [ ] Emacs setup 
    - direnv doesn't work
- [ ] VSCode
    - [x] direnv
    - [x] agda-mode https://github.com/banacorn/agda-mode-vscode/issues/81
    - [ ] agda-language-server: broken; can't build - `error: a 'x86_64-darwin' with features {} is required to build
