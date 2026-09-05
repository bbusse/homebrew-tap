class Scream < Formula
  desc "Wayland screen streaming server for RTSP, HTTP and DLNA"
  homepage "https://github.com/bbusse/scream"
  license "BSD-3-Clause"
  head "https://github.com/bbusse/scream.git", branch: "dev"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "gstreamer"

  on_linux do
    depends_on "wayland"
    depends_on "wayland-protocols"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "scream", shell_output("#{bin}/scream --version")
  end
end
