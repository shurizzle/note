#Makefile of note

VERSION = 1.0

DESTDIR ?=  /usr/local/bin
EXECUTABLE = note

all: install

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
	@cp Makefile $(EXECUTABLE) "$(EXECUTABLE)-$(VERSION)"
	@tar -cf "$(EXECUTABLE)-$(VERSION).tar" "$(EXECUTABLE)-$(VERSION)"
	@rm -R "$(EXECUTABLE)-$(VERSION)"
	@gzip "$(EXECUTABLE)-$(VERSION).tar"

.PHONY: all install uninstall dist
