cask "shape" do
  version "0.83.1"
  sha256 "3720a06fd6a326f57b69fc8c4964df28e042fbba5e6d6988f30a35878a41f8d7"

  url "https://github.com/dobrinov/shape/releases/download/v#{version}/Shape.dmg"
  name "Shape"
  desc "One board for the whole project, as text, with your AI"
  homepage "https://github.com/dobrinov/shape"

  depends_on macos: :big_sur

  app "Shape.app"

  caveats <<~TXT
    Shape → Install the shape Command… adds `shape` to Terminal,
    or keep the one from `brew install dobrinov/tap/shape`.
  TXT
end
