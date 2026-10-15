class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.2/schema-0.7.2-macos-arm64.tar.gz"
      sha256 "2c6e34b11e501eefa0ce5749106e2244f661ec914b829704ffcc3080f52a65fb"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.2/schema-0.7.2-macos-x86_64.tar.gz"
      sha256 "6820db604a55b24c51327aa0a23dce3b010b68f9b3513c598a0fb2668564f397"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.2/schema-0.7.2-linux-arm64.tar.gz"
      sha256 "ba7269c007aaac98ea58093e4836f5e2a1dc498a93a2e0aad3c7bc0273bb95f4"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.2/schema-0.7.2-linux-x86_64.tar.gz"
      sha256 "51eedd43157de618feed325fef64505b71d91af217845adc8204209500713d0e"
    end
  end

  def install
    bin.install "schema"
  end

  def caveats
    <<~TXT
      If you installed schema's agent skills (schema skills install),
      bring them up to date with this version:
        schema skills refresh
    TXT
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema --version")
  end
end
