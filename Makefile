# Zip Naming
KNAME ?= Scarlet-v1.0
CODENAME ?= redwood
DATE ?= $(shell date "+%H%M")

ZIP := $(KNAME)-$(CODENAME)-$(DATE)
EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md* LICENSE FUNDING.yml releasekey*

# Zipping
zip: $(ZIP)
$(ZIP):
	@echo "Creating ZIP: $(ZIP)-signed.zip"
	@zip -r9 "$@.zip" . -q -x $(EXCLUDE)
	@echo "Signing zip with release-keys..."
	@java -jar *.jar* releasekey.x509.pem releasekey.pk8 "$@.zip" "$@-signed.zip"
	@echo "Done!"

# Cleaning
clean:
	@rm -rf dtbo.img
	@rm -rf *dtb*
	@rm -rf Image
	@rm -rf *.zip*
	@echo "Cleaned Up."
