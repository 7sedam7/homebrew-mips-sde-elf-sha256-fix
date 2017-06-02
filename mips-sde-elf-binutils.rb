require 'formula'

class MipsSdeElfBinutils < Formula

    homepage 'http://www.gnu.org/software/binutils/binutils.html'
    url 'http://ftpmirror.gnu.org/binutils/binutils-2.25.tar.gz'
    mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.25.tar.gz'
    sha256 'cccf377168b41a52a76f46df18feb8f7285654b3c1bd69fc8265cb0fc6902f2d'

    def install
        args = [
            "--target=mips-sde-elf",
            "--prefix=#{prefix}",
            "--infodir=#{info}",
            "--mandir=#{man}",
            "--enable-interwork",
            "--enable-multilib",
            "--disable-debug",
            "--disable-dependency-tracking",
            "--disable-werror",
            "--disable-nls"
        ]

        mkdir 'build' do
            system "../configure", *args

            system "make"
            system "make", "install"
        end

        info.rmtree
    end
end
