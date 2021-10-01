# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Scarlet (k4.19)
dev.string=Tashar
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=jasmine_sprout
device.name2=wayne
device.name3=tulip
device.name4=lavender
device.name5=whyred
supported.versions=9 - 12
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;
no_block_display=1;

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

## Begin AnyKernel install
dump_boot;

# begin ramdisk changes
# end ramdisk changes

write_boot;
## End AnyKernel install
