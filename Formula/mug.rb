class Mug < Formula
  desc "Dynamic tray icons for macOS, Linux and BSD"
  homepage "https://github.com/bbusse/mug"
  license "BSD-3-Clause"
  head "https://github.com/bbusse/mug.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "mug", shell_output("#{bin}/mug --version")
  end
end
