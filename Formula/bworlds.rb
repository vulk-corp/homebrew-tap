class Bworlds < Formula
  desc "Command-line interface for BWORLDS Builds, Audits and Findings"
  homepage "https://docs.bworlds.co/docs"
  version "0.1.0-preview.11"

  # macOS is the only verified Homebrew target. Linux and automation install
  # through https://docs.bworlds.co/install.sh.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.11/bworlds_0.1.0-preview.11_darwin-arm64.tar.gz"
      sha256 "d52f8dfd80b22d1242cc1d7caf1d90162f0c0e341fd593b98ee8cbe7f08bcf6a"
    else
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.11/bworlds_0.1.0-preview.11_darwin-amd64.tar.gz"
      sha256 "d5e4d53d2c8df1420d5d2525891d269a87245d3e1935335c8af87a5c91bf437e"
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
