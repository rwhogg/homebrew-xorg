class IntelMediaDriver < Formula
  desc "Intel media driver for VAAPI"
  homepage "https://github.com/intel/media-driver"
  url "https://github.com/intel/media-driver/archive/intel-media-19.2.0.tar.gz"
  sha256 "313df4545624a51d3e6590461cbc1e633cc8f086441979cac923e4b64c16c68c"

  bottle do
    cellar :any_skip_relocation
    sha256 "22843d90266fa7549bdbea9882e8b3d36e8baece43d107db778362e9556b0f25" => :x86_64_linux
  end

  depends_on "cmake" => :build
  depends_on "linuxbrew/xorg/intel-gmmlib" => :build
  depends_on "pkg-config" => :build
  depends_on "linuxbrew/xorg/libva"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end
end
