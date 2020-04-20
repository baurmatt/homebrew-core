class Sispmctl < Formula
  desc "Control Gembird SIS-PM programmable power outlet strips"
  homepage "https://sispmctl.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/sispmctl/sispmctl/sispmctl-4.7/sispmctl-4.7.tar.gz"
  sha256 "e7d2f32f590984b6f44d758946e57776d68146e47f6cdc41d21c9218f2d2317b"

  bottle do
    sha256 "d078eb39a989062c51f6554a9942ad43e9845608ccea81c9d9f63ba5d8551dae" => :catalina
    sha256 "9fd60f6a4edd57f5416330fb92ce687e52bc8b3581d8a2b851fc4131fd6ee483" => :mojave
    sha256 "1bbce0d4a0b553847f7a5a894c5dbfd549e6d5eb9c9080f5e77421810495b521" => :high_sierra
  end

  depends_on "pkg-config" => :build
  depends_on "libusb-compat"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sispmctl -v 2>&1")
  end
end
