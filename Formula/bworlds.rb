class Bworlds < Formula
  desc "Command-line interface for BWORLDS Builds, Audits and Findings"
  homepage "https://docs.bworlds.co/docs"
  version "0.1.0-preview.12"

  # macOS is the only verified Homebrew target. Linux and automation install
  # through https://docs.bworlds.co/install.sh.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.12/bworlds_0.1.0-preview.12_darwin-arm64.tar.gz"
      sha256 "d2783ed5c3353d1568bd6b35952df1938d08cdb6458f150b62dfb618b3c11640"
    else
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.12/bworlds_0.1.0-preview.12_darwin-amd64.tar.gz"
      sha256 "f991315ba8d5aa704d1ab43823c6a3c8f0e5459dd097c34dbd6bfe1471e99a63"
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

      That one command installs all seven skills this version carries. For an
      agent it does not know, the cross-agent installer takes them from the
      documentation site:

        npx skills add https://docs.bworlds.co/bworlds-cli-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-brief-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-triage-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-fix-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-audit-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-check-SKILL.md -g
        npx skills add https://docs.bworlds.co/bworlds-guardrails-SKILL.md -g
    TEXT
  end

  test do
    assert_equal "bworlds version #{version}", shell_output("#{bin}/bworlds --version").strip
  end
end
