class RainbowBonsai < Formula
  include Language::Python::Shebang

  desc "Grow a color-cycling bonsai in your terminal"
  homepage "https://github.com/okburkard1/rainbow-bonsai"
  url "https://github.com/okburkard1/rainbow-bonsai/releases/download/v0.1.1/rainbow-bonsai-0.1.1.tar.gz"
  sha256 "4c27e1b7b106b20529ed0db1c65b2070be3b2f9c2da9fb35c09df31b0b1130b2"

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
