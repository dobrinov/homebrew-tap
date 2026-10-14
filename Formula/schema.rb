class Schema < Formula
  desc "Interactive ER diagrams and visual git diffs for Postgres structure.sql files"
  homepage "https://github.com/dobrinov/schema"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.1/schema-0.7.1-macos-arm64.tar.gz"
      sha256 "34887f659cbd3fbab82e79c3d2583770af979095fab3867f1f32613eecf511d6"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.1/schema-0.7.1-macos-x86_64.tar.gz"
      sha256 "8de18baf71659222178d74488321e0b3eac053e6ddc2c8d646585789310078e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.1/schema-0.7.1-linux-arm64.tar.gz"
      sha256 "b4e27aca6bba1d5e65428b9d6ab21de3f300470cf69a18160d554f78c32a9ffb"
    end
    on_intel do
      url "https://github.com/dobrinov/schema/releases/download/v0.7.1/schema-0.7.1-linux-x86_64.tar.gz"
      sha256 "5d8ad4bfe30524381b659e1aecd75bf9deacc2957ecf2fbf89ff643f543d876a"
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
