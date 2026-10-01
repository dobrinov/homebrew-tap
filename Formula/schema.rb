class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.2.0/schema-0.2.0-macos-arm64.tar.gz"
      sha256 "aac27b96062498cd944e3f4a021a68dc7e13b0d544b34651ab594a773199734d"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.2.0/schema-0.2.0-macos-x86_64.tar.gz"
      sha256 "8cf2da6275910db930f8e7b5a4dadfead1109efe1ecb4a41b09c1d320eb6c171"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.2.0/schema-0.2.0-linux-arm64.tar.gz"
      sha256 "74614ba82be8092e11fb48bd3b11a328383362c2dc76208364c0585ebf782797"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.2.0/schema-0.2.0-linux-x86_64.tar.gz"
      sha256 "98aa1abeaf64a63f46af7d94c1b2ec1390273b7bf4ef4f051d429017a7ff2138"
    end
  end

  def install
    bin.install "schema"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema --version")
  end
end
