image := "ghcr.io/tapdance-dna/latex-image:latest"

# Build the image locally
build:
    podman build -t {{image}} .

# Run an interactive shell in the image
shell:
    podman run --rm -it {{image}} bash

# Test that key tools are available
test:
    podman run --rm {{image}} bash -c ' \
        set -e; \
        echo "latex:    $(latex --version | head -1)"; \
        echo "git:      $(git --version)"; \
        echo "git-lfs:  $(git lfs version)"; \
        echo "make:     $(make --version | head -1)"; \
        echo "inkscape: $(inkscape --version)"; \
        echo "uv:       $(uv --version)"; \
        echo "python:   $(uv run --python 3.13 python --version)"; \
        echo "All OK"; \
    '
