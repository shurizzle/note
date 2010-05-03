#Makefile of note

VERSION = 1.1

DESTDIR ?=  /usr/local/bin
EXECUTABLE = note

all:
	@echo "If you don't know is only a bash file..."

install:
	@echo "Installing $(EXECUTABLE) in $(DESTDIR)"
	@cp "$(EXECUTABLE)" "$(DESTDIR)"
	@chmod 755 "$(DESTDIR)/$(EXECUTABLE)"

uninstall:
	@echo "Uninstalling $(EXECUTABLE) from $(DESTDIR)"
	@rm "$(DESTDIR)/$(EXECUTABLE)"

dist:
	@echo "Making tarball package"
	@mkdir -p "$(EXECUTABLE)-$(VERSION)"
	@cp README Makefile $(EXECUTABLE) "$(EXECUTABLE)-$(VERSION)"
	@tar -cf "$(EXECUTABLE)-$(VERSION).tar" "$(EXECUTABLE)-$(VERSION)"
	@rm -R "$(EXECUTABLE)-$(VERSION)"
	@gzip "$(EXECUTABLE)-$(VERSION).tar"

.PHONY: all install uninstall dist
