FROM texlive/texlive:latest

# System packages
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      git git-lfs make inkscape \
 && rm -rf /var/lib/apt/lists/*

# Typst
RUN curl -fsSL https://typst.community/typst-install/install.sh | bash \
 && mv "$HOME/.local/bin/typst" /usr/local/bin/typst

# uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Python 3.13 (available system-wide via uv)
RUN uv python install 3.13
