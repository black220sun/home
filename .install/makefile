.PHONY: all init shell package emacs calibre clojure

all: init shell package emacs

init:
	cp -r .. $(HOME)
	cd $(HOME)
	git submodule init
	git submodule update

shell: ~/.zshrc ~/.aliases
	sudo ln -sf ~/.zshrc /root/.zshrc
	sudo ln -sf ~/.aliases /root/.aliases
	sudo chsh root -s /bin/zsh
	sudo chsh $(USER) -s /bin/zsh

package: packages
	sudo apt install $(grep -vE '#' packages)

emacs:
	sudo add-apt-repository ppa:kelleyk/emacs && sudo apt update && sudo apt install emacs28

calibre:
	sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

clojure: 
	curl -O https://download.clojure.org/install/linux-install-1.11.1.1113.sh
	chmod +x linux-install-1.11.1.1113.sh
	sudo ./linux-install-1.11.1.1113.sh
	rm linux-install-1.11.1.1113.sh
