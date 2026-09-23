class VjuT < Formula
  desc "Runs a command and renders its output"
  homepage "https://github.com/bbusse/vju-t"
  license "BSD-3-Clause"
  head "https://github.com/bbusse/vju-t.git", branch: "dev"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "Usage: vju-t", shell_output("#{bin}/vju-t --help")
  end
end
