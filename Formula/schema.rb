class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.4.0/schema-0.4.0-macos-arm64.tar.gz"
      sha256 "c8895d6debd624498806982c568e883c3493ff32cb0f796ef71df131adceb6bd"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.4.0/schema-0.4.0-macos-x86_64.tar.gz"
      sha256 "6bd176a91ae9a6b8556221a38324869f786613eb75ebd2c11dec3b34a16969d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.4.0/schema-0.4.0-linux-arm64.tar.gz"
      sha256 "441329c7425b73c4593ee4a902cec4bbeb5c60098fd081d0e561144400e02d06"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.4.0/schema-0.4.0-linux-x86_64.tar.gz"
      sha256 "ab23f5edfa4ea662618aa6f08915fca6adb7f9ffaa37f66f1cdcf88e4f01fb77"
    end
  end

  def install
    bin.install "schema"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema --version")
  end
end
