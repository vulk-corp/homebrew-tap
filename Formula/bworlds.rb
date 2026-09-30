class Bworlds < Formula
  desc "Command-line interface for BWORLDS Builds, Audits and Findings"
  homepage "https://docs.bworlds.co/docs"
  version "0.1.0-preview.1"

  # macOS is the only verified Homebrew target. Linux and automation install
  # through https://docs.bworlds.co/install.sh.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.1/bworlds_0.1.0-preview.1_darwin-arm64.tar.gz"
      sha256 "f24c5ef586e3f6e29740dd15f114b7b9cd85d78509d25f408a264ce8c6a3c310"
    else
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.1/bworlds_0.1.0-preview.1_darwin-amd64.tar.gz"
      sha256 "21768d799cbc7a01056dd9843e7bc4ad2cacb9fd98d8ce95233d360313a76c98"
    end
  end

  # The archive also carries the operator skill, which belongs in a home
  # directory a package install never writes to; the caveats cover it.
  def install
    bin.install "bworlds"
  end

  def caveats
    <<~TEXT
      A coding agent reads the operator skill from your home directory. Install it once:

        mkdir -p ~/.claude/skills/bworlds-operator
        curl -fsSL https://docs.bworlds.co/bworlds-operator-SKILL.md -o ~/.claude/skills/bworlds-operator/SKILL.md
    TEXT
  end

  test do
    assert_equal "bworlds version #{version}", shell_output("#{bin}/bworlds --version").strip
  end
end
