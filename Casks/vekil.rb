cask "vekil" do
  version "0.12.0"
  sha256 "8bef2a3dcda864e8e630b46202416910b7fc7c63b63b9d1e45d932405a3e9526"

  url "https://github.com/sozercan/vekil/releases/download/v#{version}/vekil-macos-arm64.zip"
  name "Vekil"
  desc "Proxy Anthropic, Gemini, and OpenAI clients through GitHub Copilot"
  homepage "https://github.com/sozercan/vekil"

  depends_on arch: :arm64

  app "Vekil.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Vekil.app"], sudo: false
  end

  zap trash: [
    "~/.config/vekil",
    "~/Library/LaunchAgents/com.vekil.menubar.plist",
  ]
end
