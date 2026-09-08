# Overleaf report dependencies

The app image extends `sharelatex/sharelatex:6.1.2` with the LaTeX packages
needed by report projects, including the runtime dependencies of `algorithm2e`
and the `tcolorbox` skins, theorems, breakable, and listings libraries.
Packages come from the frozen TeX Live 2025 repository to match the base image.
The build does not upgrade existing packages or install a full TeX Live scheme.

From the parent OSWorld-web checkout, build and recreate only the app:

```bash
docker compose build overleaf_web_app
docker compose up -d --no-deps overleaf_web_app
```

For a first deployment, use the parent's normal `docker compose up -d` command
so that MongoDB, Redis, and the admin bootstrap are also started. Dependencies
are installed at image build time and survive app container recreation.

Run the report package smoke test from this directory:

```bash
docker build -t overleaf-report-deps .
docker run --rm --entrypoint sh \
  --mount "type=bind,src=$PWD/tests,dst=/tests,readonly" \
  overleaf-report-deps -c \
  'mkdir -p /tmp/report-check && cd /tmp/report-check && pdflatex -interaction=nonstopmode -halt-on-error /tests/report-dependencies.tex'
```

For a browser check, upload `tests/report-dependencies.tex` to a new Overleaf
project and recompile. It must produce a PDF without missing-package errors.
