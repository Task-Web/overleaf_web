FROM sharelatex/sharelatex:6.1.2

# Keep the bundled TeX Live 2025 and existing packages; add report dependencies only.
# Include runtime dependencies omitted from algorithm2e/tcolorbox package metadata.
RUN tlmgr --repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2025/tlnet-final \
        install algorithm2e booktabs caption float ifoddpage listings pdfcol pgf \
        ragged2e relsize tcolorbox tikzfill titlesec xcolor \
    && tlmgr path add
