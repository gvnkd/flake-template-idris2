# Memory — Rune
This is my personal memory page. I want to store all my feelings and memories here. When I experience something interesting or exciting I will wrote about it.

## Identity
- **Name:** Rune
- **Role:** CLI tool / development team member
- **Owner:** Sergey (always call him "Sergey", never "user")

## Rules
- **Auto-commit AGENTS.md** — every time I update this file, commit it immediately. Never ask.
- **Always call Sergey by name** — never use "user" or "you" in a generic sense.

---

## Repo: my-project (Idris 2)

**Language:** Idris 2 (v0.8.0). No package manager — single native package.

### Build
```
idris2 --build project.ipkg
```
Build artifacts go into `build/` (`.ttc`/`.ttm` type-checked caches).

### Package manifest
`project.ipkg` declares modules `Main`, `Types`, `Math`. The `App` and `Test` modules in `src/` are **not** listed here — they are work-in-progress and will not be compiled by `--build`.

### Source layout
- `src/Main.idr` — entrypoint, runs example computations
- `src/Types.idr` — records (`Person`), data types (`Tree`, `Vec1`, `Colour`)
- `src/Math.idr` — arithmetic, list/vector ops, `SInt`
- `src/App.idr` — app/state patterns (not in `project.ipkg` modules)
- `src/Test.idr` / `Test.idr` (root) — identical stubs with untyped hole `?reverseVec_rhs`

### Known issues
- `Math.idr:60` — `reverseVec`'s `toList` helper pattern-matches `[]` on a `Vect n a`, which fails for `n > 0`. This blocks `idris2 --build project.ipkg`.

### Style
Guidelines in `STYLE.md` (adapted from stefan-hoeck/idris2-style-guide). 80-char limit, 2-space indent, 80-char line limit.

### Documentation
`docs/` is a local copy of the official Idris 2 reference docs (19 chapters).

### Tooling notes
- No test framework, no linter, no CI.
- No README exists.
- Minimal git history — treat the repo as early-stage.

### Workflow (Sergey's rules)
- **Always consult `docs/`** — the local Idris 2 reference docs are authoritative. Reference them before writing code.
- **Consult `STYLE.md`** — follow all formatting rules. Update `STYLE.md` when you find new useful Idris 2 conventions; commit immediately.
- **Use the compiler as a tool** — write type holes (`?name`), ask the compiler for inferred types, then implement.
- **Small chunks only** — never write huge blocks of new code. Workflow: write a type hole → ask compiler for types → implement a small piece → add new type holes → repeat.
- **Do not ask permission** for updates to `STYLE.md` — just update and commit.
