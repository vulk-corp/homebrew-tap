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

  # The archive also carries the skills. They stay out of the keg because a
  # coding agent reads them from a home directory, where the caveats put the
  # single copy that every agent on the machine shares.
  def install
    bin.install "bworlds"
  end

  def caveats
    <<~TEXT
      Give your coding agent the BWORLDS skills:

        npx skills add https://docs.bworlds.co/bworlds-cli-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-audit-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-check-SKILL.md -g
    TEXT
  end

  test do
    assert_equal "bworlds version #{version}", shell_output("#{bin}/bworlds --version").strip
  end
end
