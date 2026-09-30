class Bworlds < Formula
  desc "Command-line interface for BWORLDS Builds, Audits and Findings"
  homepage "https://docs.bworlds.co/docs"
  version "0.1.0-preview.2"

  # macOS is the only verified Homebrew target. Linux and automation install
  # through https://docs.bworlds.co/install.sh.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.2/bworlds_0.1.0-preview.2_darwin-arm64.tar.gz"
      sha256 "6b007505dee7e5e3c7c162c2f1d1daf77f987bdc00d1290f06bd1c68f731cea7"
    else
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.2/bworlds_0.1.0-preview.2_darwin-amd64.tar.gz"
      sha256 "7fc837e1b2b80bbc0180620b8a3c5adbd836e97a6418759591243af68c2b910b"
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
