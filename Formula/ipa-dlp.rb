class IpaDlp < Formula
  include Language::Python::Shebang

  desc "Fetch and decrypt App Store IPAs for apps your Apple ID owns"
  homepage "https://github.com/ipakit/ipa-dlp"
  url "https://github.com/ipakit/ipa-dlp/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "cbe7a9f158367d9bd81b935f18e7ca3469196d747ef74136d58df139b9422105"
  license "MIT"
  head "https://github.com/ipakit/ipa-dlp.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos
  depends_on "python@3.14"

  def install
    libexec.install "ipa-dlp", "ipa_dlp.py"
    chmod 0755, libexec/"ipa-dlp"
    rewrite_shebang detected_python_shebang, libexec/"ipa-dlp"
    (bin/"ipa-dlp").write_exec_script libexec/"ipa-dlp"
  end

  test do
    assert_match(/ipa-dlp \d+\.\d+\.\d+/, shell_output("#{bin}/ipa-dlp --version"))
  end
end
