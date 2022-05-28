# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=Scarlet-X
kernel.compiler=Neutron Clang 15
kernel.made=Tashar
message.word=Thank you for installing Scarlet-X
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=lavender
device.name2=tulip
device.name3=jasmine_sprout
device.name4=wayne
device.name5=whyred
supported.versions=9 - 13
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

ui_print " ";
ui_print "Patching system's build prop for FUSE Passthrough..." 
# FUSE Passthrough
patch_prop /system/build.prop "persist.sys.fuse.passthrough.enable" "true" 

## AnyKernel boot install
dump_boot;

write_boot;
## end boot install
## End AnyKernel install
