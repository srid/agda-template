# Agda project template using Nix

WIP

```
nix develop -c agda -v 2 src/hello.agda
```

## Editor support

### VSCode

Broken: https://github.com/banacorn/agda-mode-vscode/issues/81

### Emacs 

Agda people use Emacs, so this is probably what you should use. 

In Doom Emacs' init.el, add `(direnv)` and `(agda +local)` features. You **must** have Agda installed globally, because Doom's Agda configuration is [hairbrained](https://github.com/hlissner/doom-emacs/blob/f458f9776049fd7e9523318582feed682e7d575c/modules/lang/agda/config.el#L3-L8) to not work with direnv, which we need with graphical Emacs (on macOS). It goes without saying that you need `direnv` and `nix-direnv` installed and configured.


#### Doom Emacs

Useful shortcuts,

- `SPC m l` - compile the buffer
