class Gn < Formula
  desc "Meta-build system for generating Ninja build files"
  homepage "https://gn.googlesource.com/"
  url "https://gn.googlesource.com/gn",
      using:    :git,
      revision: "dcc5e98fbd103caf0b1168207895877deb45742f"
  version "2026.04.24"
  license "BSD-3-Clause"

  depends_on macos: :catalina
  depends_on "ninja"
  depends_on "python3" => :build

  def install
    system "python3", "build/gen.py"
    system "ninja", "-C", "out"

    bin.install "out/gn"
  end

  test do
    system bin/"gn", "help"
  end
end
