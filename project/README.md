# my-project

An Idris 2 project built with Nix.

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

## Project structure

```
project.ipkg       Package manifest — declares modules and entrypoint
src/               Idris source files
  Main.idr         Entrypoint
  Types.idr        Records and data types
  Math.idr         Arithmetic and list/vector utilities
docs/              Idris 2 language reference (19 chapters)
```

## Docs

The `docs/` directory contains a local copy of the Idris 2 language reference. See `docs/01-introduction.md` to start.

## License

MIT
