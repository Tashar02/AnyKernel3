# Zip Naming
KNAME ?= Scarlet-X-v1.0
CODENAME ?= redwood
DATE ?= $(shell date "+%H%M")

ZIP := $(KNAME)-$(CODENAME)-$(DATE)
EXCLUDE := Makefile *.git* *.jar* *placeholder* *.md*

# Zipping
zip: $(ZIP)
$(ZIP):
	@echo "Creating ZIP: $(ZIP)-signed.zip"
	@zip -r9 "$@.zip" . -q -x $(EXCLUDE)
	@echo "Signing zip with aosp keys..."
	@java -jar *.jar* "$@.zip" "$@-signed.zip"
	@echo "Done!"

# Cleaning
clean:
	@rm -rf modules/vendor/lib/modules/modules.{alias,dep,softdep,load}
	@rm -rf modules/vendor/lib/modules/*.ko
	@rm -rf vendor_ramdisk/lib/modules/*.ko	
	@rm -rf dtbo.img
	@rm -rf *dtb*
	@rm -rf Image
	@rm -rf *.zip*
	@echo "Cleaned Up." 
