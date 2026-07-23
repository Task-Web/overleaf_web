FROM sharelatex/sharelatex:6.1.2@sha256:b963fd9b47813c8dc809e6882788b5f332ff00e6acc09f4aa61fdf08d6355772

# TeX Live cannot install packages across annual releases, so keep this
# TeX Live 2025 base on its frozen repository.
ARG TEXLIVE_REPOSITORY=https://mirrors.tuna.tsinghua.edu.cn/tex-historic-archive/systems/texlive/2025/tlnet-final

RUN set -eux; \
    tlmgr option repository "${TEXLIVE_REPOSITORY}"; \
    tlmgr install scheme-full; \
    tlmgr path add
