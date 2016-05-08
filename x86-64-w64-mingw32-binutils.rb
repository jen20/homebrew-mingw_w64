class X8664W64Mingw32Binutils < Formula
  desc "Binutils for minimalist GNU for Windows."
  homepage "https://mingw-w64.sourceforge.net/"
  url "http://ftpmirror.gnu.org/binutils/binutils-2.26.tar.gz"
  mirror "https://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz"
  sha256 "9615feddaeedc214d1a1ecd77b6697449c952eab69d79ab2125ea050e944bcc1"

  keg_only <<-EOS.undent
    This formula is mainly used internally by other formulae.
EOS

  depends_on "gcc49" => :build

  def install
    target_arch = "x86_64-w64-mingw32"
    args = %W[
      CC=gcc-4.9
      CXX=g++-4.9
      CPP=cpp-4.9
      LD=gcc-4.9
      --target=#{target_arch}
      --disable-werror
      --disable-multilib
      --prefix=#{prefix}
    ]

    system "./configure", *args
    system "make"
    system "make", "install-strip"
  end
end
