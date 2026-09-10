class Porthole < Formula
  desc "macOS desktop widget showing an image fetched from a URL"
  homepage "https://github.com/bbusse/porthole"
  license "BSD-3-Clause"
  head "https://github.com/bbusse/porthole.git", branch: "dev"

  depends_on xcode: ["15.0", :build]
  depends_on "xcodegen" => :build
  depends_on macos: :sonoma

  def install
    system "xcodegen", "generate"
    system "make", "sign"
    prefix.install "build/Build/Products/Release/Porthole.app"
  end

  def caveats
    <<~EOS
      WidgetKit only picks up extensions from apps in /Applications, and a
      symlink is not enough. Copy the app there and register it:
        cp -R #{opt_prefix}/Porthole.app /Applications/
        pluginkit -a /Applications/Porthole.app/Contents/PlugIns/PortholeExtension.appex
      Then add Porthole from the widget picker
    EOS
  end

  test do
    system "codesign", "--verify", "--deep", "--strict", prefix/"Porthole.app"
  end
end
