class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.3.0/schema-0.3.0-macos-arm64.tar.gz"
      sha256 "af322fd84719182c7d3dc85116ef643690e75968d58371aaba0a40d3d16b1b54"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.3.0/schema-0.3.0-macos-x86_64.tar.gz"
      sha256 "c192c9ba5d9e4f6d7bd6ae86cf269d420d589879a3e8ade1e881260d4a5c9857"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.3.0/schema-0.3.0-linux-arm64.tar.gz"
      sha256 "7348b544d7b0ef7c85c1f3014781b7c1bb0f0254a4296ed692a3150783701b10"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.3.0/schema-0.3.0-linux-x86_64.tar.gz"
      sha256 "e1a2c1a6374f94692824698a57ff5aa6d23ce1e4bc018f4a0b3001936712239e"
    end
  end

  def install
    bin.install "schema"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema --version")
  end
end
