class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.6.0/schema-0.6.0-macos-arm64.tar.gz"
      sha256 "fb5ec5e0bc1a4314c5199546ba507474165ec2ffaf9a4d772c4bfa942247e1eb"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.6.0/schema-0.6.0-macos-x86_64.tar.gz"
      sha256 "eaa88b96774f3372c99bd48bf02f919775b64c283199a977ce8cfef2a930e99b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.6.0/schema-0.6.0-linux-arm64.tar.gz"
      sha256 "ad8ef49fa71b2d7479a82ac7d626674377e488de6802bc3ae988f030aeb3eaca"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.6.0/schema-0.6.0-linux-x86_64.tar.gz"
      sha256 "0d8f493a87194020b2db1359684ed772ac321c40f005e258fdf2d6a6215c5d2e"
    end
  end

  def install
    bin.install "schema"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema --version")
  end
end
