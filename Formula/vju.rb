class Vju < Formula
  desc "Widget for displaying text and images piped from stdin"
  homepage "https://github.com/bbusse/vju"
  license any_of: ["MIT", "Apache-2.0"]
  head "https://github.com/bbusse/vju.git", branch: "main"

  depends_on "rust" => :build

  on_linux do
    depends_on "pkgconf" => :build
    depends_on "alsa-lib"
    depends_on "libx11"
    depends_on "libxkbcommon"
    depends_on "mesa"
    depends_on "wayland"
  end

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "vju", shell_output("#{bin}/vju --version")
  end
end
