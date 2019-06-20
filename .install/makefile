.PHONY: all init shell package emacs calibre closure

all: init shell package emacs

init:
	cp -r .. $HOME
	cd $HOME
	git submodule init
	git submodule update

shell: ~/.zshrc ~/.aliases
	sudo ln -sf ~/.zshrc /root/.zshrc
	sudo ln -sf ~/.aliases /root/.aliases
	sudo chsh root -s /bin/zsh
	sudo chsh $USER -s /bin/zsh

package: packages
	sudo apt install $(grep -vE '#' packages)

emacs: emacs-26.1
	(cd emacs-26.1 && ./configure && sudo make -j4 install)

emacs-26.1: emacs-26.1.tar.gz
	tar zxf emacs-26.1.tar.gz

emacs-26.1.tar.gz:
	wget http://ftp.gnu.org.ua/gnu/emacs/emacs-26.1.tar.gz

calibre:
	sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

closure: closure.sh
	./closure.sh
