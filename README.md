# BWORLDS Homebrew tap

Homebrew formulae for BWORLDS command-line tools. This repository carries formulae only; no product source lives here.

```console
brew install vulk-corp/tap/bworlds
bworlds --version
```

Upgrade with the rest of your tools:

```console
brew upgrade
```

A package install cannot write into your home directory, so it does not place the operator skill a coding agent reads. The formula prints how to install it after `brew install`.

macOS is the supported target. On Linux, and in automation that pins a version, install the CLI with the script at <https://docs.bworlds.co/install.sh>.

The `Publish CLI release` workflow in the BWORLDS repository renders `Formula/bworlds.rb` against the checksums published at <https://docs.bworlds.co> and pushes it here. Edit the template there, not the formula here.

Full documentation: <https://docs.bworlds.co/docs>
