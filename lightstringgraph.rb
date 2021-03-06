class Lightstringgraph < Formula
  desc "Lightweight string graph construction"
  homepage "http://lsg.algolab.eu/"
  # https://arxiv.org/pdf/1405.7520.pdf
  url "https://github.com/AlgoLab/LightStringGraph/archive/v0.4.0.tar.gz"
  sha256 "7a1530b147269b285875687fecaecbfd4d94c3db04d33ddeb1d0624547317b00"
  revision 3
  head "https://github.com/AlgoLab/LightStringGraph.git"

  bottle do
    cellar :any
    sha256 "1d4178768a325048be4bd52b8408adabc01f60f15a1d07e27d98d8d0f132c55c" => :sierra
    sha256 "b4d75609112fcb4f04ea8e5b066e74408fd697224e543b22dac1618eb3e6e380" => :el_capitan
    sha256 "7a2c4769125a547e0a79acda893a80184352d5e0d98ca1c38d45e1f4e67c3e7a" => :x86_64_linux
  end

  depends_on "boost"
  depends_on "beetl" => :recommended

  fails_with :clang do
    cause "error: variable length array of non-POD element type 'string'"
  end

  def install
    system "make", "all"
    bin.install Dir["bin/*"]
    doc.install %w[COPYING README.md]
  end

  test do
    system "#{bin}/lsg 2>&1 |grep lsg"
  end
end
