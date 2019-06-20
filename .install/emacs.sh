wget http://ftp.gnu.org.ua/gnu/emacs/emacs-26.1.tar.gz
tar zfx emacs-26.1.tar.gz
rm -rvf emacs-26.1.tar.gz
cd emacs-26.1
./configure && sudo make -j4 install
