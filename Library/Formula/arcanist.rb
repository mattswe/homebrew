require 'formula'

class Arcanist < Formula
  class Libphutil < Formula
    url 'https://github.com/facebook/libphutil/zipball/84cac75fbcc7b4450aa9f3ada1c504737393d28d'
    sha1 '8e8763a3a9bb691a4eeaad65f326f41992656d13'
    version '1.0.2'
  end

  homepage 'http://phabricator.org'
  url 'https://github.com/facebook/arcanist/zipball/67061480f92f5c0743a8402a34bd408341c63079'
  version '1.0.2'
  sha1 'c8ad1fa3e46d4b97d8db6c6c66ae8bfecd433bbc'

  def install
    Libphutil.new.brew do
      (prefix + "libphutil/").install Dir['*']
    end

    (prefix + "arcanist/").install %w{bin externals resources scripts src}
    bin.install_symlink prefix + "arcanist/bin/arc"
  end

  def test
    system "arc help"
  end

  def caveats
    <<-EOS.undent
    Now check out http://www.phabricator.com/docs/phabricator/article/Arcanist_User_Guide.html#overview
    EOS
  end
end
