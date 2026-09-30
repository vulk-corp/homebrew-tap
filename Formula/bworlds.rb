class Bworlds < Formula
  desc "Command-line interface for BWORLDS Builds, Audits and Findings"
  homepage "https://docs.bworlds.co/docs"
  version "0.1.0-preview.6"

  # macOS is the only verified Homebrew target. Linux and automation install
  # through https://docs.bworlds.co/install.sh.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.6/bworlds_0.1.0-preview.6_darwin-arm64.tar.gz"
      sha256 "4de6d5c00750ff950b31652298346eb77bf122fa538581350b978a030acc88ce"
    else
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.6/bworlds_0.1.0-preview.6_darwin-amd64.tar.gz"
      sha256 "659cb6681aa68253d0ad20056a4d1e25d38fd28b5d1ed3da08788b1c99dfcb35"
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
