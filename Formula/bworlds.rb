class Bworlds < Formula
  desc "Command-line interface for BWORLDS Builds, Audits and Findings"
  homepage "https://docs.bworlds.co/docs"
  version "0.1.0-preview.16"

  # macOS is the only verified Homebrew target. Linux and automation install
  # through https://docs.bworlds.co/install.sh.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.16/bworlds_0.1.0-preview.16_darwin-arm64.tar.gz"
      sha256 "6ec8476984d10c5fe3989d694f8f4e3816a363d79e98bedc36b1c381dd94e059"
    else
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.16/bworlds_0.1.0-preview.16_darwin-amd64.tar.gz"
      sha256 "784dc01f4456ff07790bf1c8a1f1cbf54cb03251871ce89eb1834279c238a230"
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
