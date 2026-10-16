class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.3/schema-0.7.3-macos-arm64.tar.gz"
      sha256 "694ac72915be870cd24761403b3808eb52e43ea0839133d7d5368ca22a4a7479"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.3/schema-0.7.3-macos-x86_64.tar.gz"
      sha256 "87f4cb83b17edc55e662f17950a5335762b6d26ed80d46fc38fb52f97834ce74"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.3/schema-0.7.3-linux-arm64.tar.gz"
      sha256 "c60549f12356d0792652ce7dbf50598751ad56babbc3dca0560aa64579b53deb"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.3/schema-0.7.3-linux-x86_64.tar.gz"
      sha256 "4cc56fed3870c5d372a4ad404d22c6efd8e4d4c283f544fcdfebbb558f4d29c1"
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
