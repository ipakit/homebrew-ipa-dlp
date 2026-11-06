class IpaDlp < Formula
  include Language::Python::Shebang

  desc "Fetch and decrypt App Store IPAs for apps your Apple ID owns"
  homepage "https://github.com/bejminliou/ipa-dlp"
  url "https://github.com/bejminliou/ipa-dlp/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "15bd33cecd5b72d53ea2288233f546f8d3597120fa238555c9e46dd5771acc7b"
  license "MIT"
  head "https://github.com/bejminliou/ipa-dlp.git", branch: "main"

  depends_on :macos
  depends_on "python@3.14"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "ipa-dlp"
    rewrite_shebang detected_python_shebang, bin/"ipa-dlp"
    pkgshare.install "ipa-dlp.command"
  end

  def caveats
    <<~EOS
      The CLI is installed as `ipa-dlp`. Run `ipa-dlp setup` once.

      For the double-clickable wizard:
        mkdir -p ~/Applications
        cp #{opt_pkgshare}/ipa-dlp.command ~/Applications/
        chmod +x ~/Applications/ipa-dlp.command
    EOS
  end

  test do
    assert_match "ipa-dlp 0.2.0", shell_output("#{bin}/ipa-dlp --version")
  end
end
