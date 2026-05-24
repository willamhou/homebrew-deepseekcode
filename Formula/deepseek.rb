class Deepseek < Formula
  desc "DeepSeek-first terminal code agent"
  homepage "https://github.com/willamhou/DeepSeekCode"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.3/deepseek-macos-arm64.tar.gz"
      sha256 "82da0694307358050db12a0ceabeb843b37e0d715d2079748f5cb78af03b928e"
    else
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.3/deepseek-macos-x64.tar.gz"
      sha256 "c8ca66c835d138c826026d94d0fee7e88fcc8b59bcc4f4342d3d6d4d99569973"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.3/deepseek-linux-x64.tar.gz"
      sha256 "b9e65e06105099347be0aab422d61bfccbd65e105077e388cc1634831706c921"
    elsif Hardware::CPU.arm?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.3/deepseek-linux-arm64.tar.gz"
      sha256 "5b84bfb5ea619cfcfb95302a6e09c51dcb08e93a5e1d34a09e0915c15e84161f"
    else
      odie "DeepSeekCode Homebrew formula currently publishes Linux x64 and arm64 only"
    end
  end

  def install
    binary = Dir["deepseek*/deepseek"].first || "deepseek"
    bin.install binary => "deepseek"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deepseek version")
    system "#{bin}/deepseek", "doctor", "--json"
  end
end
