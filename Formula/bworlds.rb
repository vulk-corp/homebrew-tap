class Bworlds < Formula
  desc "Command-line interface for BWORLDS Builds, Audits and Findings"
  homepage "https://docs.bworlds.co/docs"
  version "0.1.0-preview.4"

  # macOS is the only verified Homebrew target. Linux and automation install
  # through https://docs.bworlds.co/install.sh.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.4/bworlds_0.1.0-preview.4_darwin-arm64.tar.gz"
      sha256 "7f68dffd9e06234e57757287077cbb0a98d7b9ee9cf80d4ae5b8f7f2bb8afc45"
    else
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.4/bworlds_0.1.0-preview.4_darwin-amd64.tar.gz"
      sha256 "22ab03b1fb72543866e6dbe0b1006eeb3702b01b88488b97d9a0b9a14f8821d8"
    end
  end

  # The archive holds the executable alone. The executable carries the skills
  # and installs them into a home directory a keg cannot write.
  def install
    bin.install "bworlds"
  end

  def caveats
    <<~TEXT
      Give your coding agents the BWORLDS skills:

        bworlds agent setup

      It installs the skills this version carries. For an agent it does not
      know, the cross-agent installer takes them from the documentation site:

        npx skills add https://docs.bworlds.co/bworlds-cli-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-audit-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-check-SKILL.md -g
    TEXT
  end

  test do
    assert_equal "bworlds version #{version}", shell_output("#{bin}/bworlds --version").strip
  end
end
