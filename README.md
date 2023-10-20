# Dotfiles

This repo contains my dotfiles and instructions on how to setup them

## Setup

**WARNING!!!** The script below will override any existing files. It is meant for setting up a new OS installation from scratch and contains all of my dotfiles.

Run `./setup.sh`

## Sensitive data

If you want to add sensitive data in your dotfiles, like git HTTP credentials, etc. then put them inside `extras/`.
That directory is ignored in git, so it won't be accidentally committed.
