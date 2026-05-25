class Deepseek < Formula
  desc "DeepSeek-first terminal code agent"
  homepage "https://github.com/willamhou/DeepSeekCode"
  version "0.1.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.4/deepseek-macos-arm64.tar.gz"
      sha256 "7344e7ac79967fc5b067f0def3753ce16dc820f66e9071227d64f02d4cc9d31d"
    else
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.4/deepseek-macos-x64.tar.gz"
      sha256 "99ae63d0bee0b925681e9c1a6077dd3ea53bc76d6170f42539db8ec7b6141b86"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.4/deepseek-linux-x64.tar.gz"
      sha256 "8d5f1ac987e9a7e5132785609c48d3f7e006dca903c56dea80903dbe8cd7631c"
    elsif Hardware::CPU.arm64?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.4/deepseek-linux-arm64.tar.gz"
      sha256 "a392d81705eaf4493044a47012a481b40322c508d3418e17bfe6b048bfa75042"
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
