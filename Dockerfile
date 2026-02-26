FROM texlive/texlive:latest

# System packages
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      git git-lfs make inkscape \
 && rm -rf /var/lib/apt/lists/*

# uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# Python 3.13 (available system-wide via uv)
RUN uv python install 3.13
