class IpaDlp < Formula
  include Language::Python::Shebang

  desc "Fetch and decrypt App Store IPAs for apps your Apple ID owns"
  homepage "https://github.com/ipakit/ipa-dlp"
  url "https://github.com/ipakit/ipa-dlp/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "78b9c17187d7b2fdfe66dfd67ed253c7b2a52342f4d722274419711cccff93ec"
  license "MIT"
  head "https://github.com/ipakit/ipa-dlp.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos
  depends_on "python@3.14"

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
    assert_match(/ipa-dlp \d+\.\d+\.\d+/, shell_output("#{bin}/ipa-dlp --version"))
  end
end
