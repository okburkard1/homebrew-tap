class RainbowBonsai < Formula
  include Language::Python::Shebang

  desc "Grow a color-cycling bonsai in your terminal"
  homepage "https://github.com/okburkard1/rainbow-bonsai"
  url "https://github.com/okburkard1/rainbow-bonsai/releases/download/v0.1.2/rainbow-bonsai-0.1.2.tar.gz"
  sha256 "c1b2ba5fddf742e896626423c7a94724997e4d2bc8569183b5b3325e7df00e9d"

  depends_on "python@3.15"

  def install
    rewrite_shebang detected_python_shebang, "rainbow-bonsai"
    bin.install "rainbow-bonsai"
  end

  test do
    assert_match "--dirt", shell_output("#{bin}/rainbow-bonsai -help")
    assert_match "terminal", shell_output("#{bin}/rainbow-bonsai </dev/null 2>&1", 1)
  end
end
