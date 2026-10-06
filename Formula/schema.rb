class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.0/schema-0.7.0-macos-arm64.tar.gz"
      sha256 "b20b63b0f336d428a8504f4b668f8729094110c9c85a3aa18465eae0f54b398b"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.0/schema-0.7.0-macos-x86_64.tar.gz"
      sha256 "38e4527d808c907aa12d94e1d21cca53eb96f7a26fa719b068338038fe5e9cd9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.0/schema-0.7.0-linux-arm64.tar.gz"
      sha256 "4a491126bbc7a28677e2a49f937048473a0003dc1b877a6ce7c5e6cbe682c2c8"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.0/schema-0.7.0-linux-x86_64.tar.gz"
      sha256 "2907b33a4bd122be0bbe93a579e5a38e738d09ce1284c9e9253fcb31def9720d"
    end
  end

  def install
    bin.install "schema"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema --version")
  end
end
