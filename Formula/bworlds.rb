class Bworlds < Formula
  desc "Command-line interface for BWORLDS Builds, Audits and Findings"
  homepage "https://docs.bworlds.co/docs"
  version "0.1.0-preview.5"

  # macOS is the only verified Homebrew target. Linux and automation install
  # through https://docs.bworlds.co/install.sh.
  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.5/bworlds_0.1.0-preview.5_darwin-arm64.tar.gz"
      sha256 "54d7ca0adbb31b5a453d330218d54cecd8b770b1aa7dfcdfd281c1bc8d2a7a11"
    else
      url "https://docs.bworlds.co/downloads/bworlds/0.1.0-preview.5/bworlds_0.1.0-preview.5_darwin-amd64.tar.gz"
      sha256 "3b6d1477ce14ff83f812aa39f2573181957565bb929b39b3104785320edc7bce"
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
