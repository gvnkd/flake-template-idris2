# flake-template-idris2

A Nix flake template for bootstrapping Idris 2 projects. Provides a `devShell`, a buildable package, and a self-contained project skeleton.

## Quick start

```bash
mkdir my-idris-project && cd my-idris-project
nix flake init --template github:gvnkd/flake-template-idris2
```

This creates:

- `flake.nix` — with a `devShell` (`idris2`) and a default `package`
- `project.ipkg` — Idris 2 package manifest
- `src/` — starter source files (`Main.idr`, `Types.idr`, `Math.idr`, `App.idr`, `Test.idr`)

## Building

```bash
nix build .
./result/bin/project
```

## Dev shell

```bash
nix develop
idris2 --build project.ipkg
```

## Template source

The template lives under `project/`. The root `flake.nix` defines `templates.x86_64-linux.default` pointing to it. To use a local path:

```bash
nix flake init --template /path/to/this/repo
```

## License

MIT
