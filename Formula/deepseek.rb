class Deepseek < Formula
  desc "DeepSeek-first terminal code agent"
  homepage "https://github.com/willamhou/DeepSeekCode"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.2/deepseek-macos-arm64.tar.gz"
      sha256 "f08d13a0ec99109a25de995adb6f0549c0b0f5f9c531eab82ded8f5c8c56e69d"
    else
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.2/deepseek-macos-x64.tar.gz"
      sha256 "96ccd97b6f163ade428c8239e91e126cc3ee784a823f8cea2dcdbb803953446d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/willamhou/DeepSeekCode/releases/download/v0.1.2/deepseek-linux-x64.tar.gz"
      sha256 "56d826ff3ccb0ecab9487e0d6e1ccd7741ce9a3d54dd9b1f5cf079f8162cf5a0"
    else
      odie "DeepSeekCode Homebrew formula currently publishes Linux x64 only"
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
