FROM nixos/nix:2.5.1

# Install git
RUN set -x && \
    nix-channel --update && \
    nix-env -iA nixpkgs.git && \
    nix-collect-garbage

# Create the necessary symlinks for Bitbucket
RUN set -x && \
    ln -s $(which echo) /bin && \
    ln -s $(which cat) /bin && \
    ln -s $(which mkfifo) /usr/bin

# Enable flakes
RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf
