# Homebrew formula for the tap repository (<owner>/homebrew-tap, Formula/decision-workspace.rb).
# The release workflow fills in 0.1.0, https://github.com/k-ishida814/decision-workspace/releases/download/v0.1.0/dw-0.1.0-darwin-arm64.tar.gz, 465efee6241a8e806fbf382e7647e5a3b2679466ff62d89438787d016960b0b8 and https://github.com/k-ishida814/decision-workspace and attaches the
# result to the GitHub release; copy it into the tap.
class DecisionWorkspace < Formula
  desc "Answer Claude Code's questions one at a time in a separate workspace"
  homepage "https://github.com/k-ishida814/decision-workspace"
  url "https://github.com/k-ishida814/decision-workspace/releases/download/v0.1.0/dw-0.1.0-darwin-arm64.tar.gz"
  version "0.1.0"
  sha256 "465efee6241a8e806fbf382e7647e5a3b2679466ff62d89438787d016960b0b8"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "dw"
  end

  def caveats
    <<~EOS
      In each project where you use Claude Code:
        dw install     # add the hook and MCP server to the project
        dw tui         # keep this open; questions arrive here
    EOS
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/dw version").strip
  end
end
