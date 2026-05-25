class Deepseek < Formula
  desc "DeepSeek-first terminal code agent"
  homepage "https://github.com/willamhou/DeepSeekCode"
  version "0.1.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.5/deepseek-macos-arm64.tar.gz"
      sha256 "40631f7481e37d2671c13e30f25f062c7c207551dc112f7cb3f4e086c1bfb2e6"
    else
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.5/deepseek-macos-x64.tar.gz"
      sha256 "ab7c6a342252e469d1a31fe57558315413f570cad455f689cbcae3839b67cfc1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.5/deepseek-linux-x64.tar.gz"
      sha256 "444ac1701271ab3f9a945e36c21c67247b429f116cf5cfd4857b80efe98bf1b8"
    elsif Hardware::CPU.arm64?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.5/deepseek-linux-arm64.tar.gz"
      sha256 "a2673e46370713d7e4e296981d11c4762c96ce0660af019582366e6873f8c3a6"
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
