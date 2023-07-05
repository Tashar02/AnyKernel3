### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# begin properties
properties() { '
kernel.string=Scarlet-X
kernel.compiler=Neutron Clang 17
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

### AnyKernel install
# begin attributes
attributes() {
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;
} # end attributes

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh && attributes;

ui_print " ";
# FUSE Passthrough
android_ver=$(file_getprop /system/build.prop ro.build.version.release);
fuse_passthrough=$(getprop persist.sys.fuse.passthrough.enable);
BBOX="$home/tools/busybox"

if [ $android_ver -gt 11 ] && [ $fuse_passthrough != "true" ]; then
	ui_print "Remounting /system as rw..."
	$BBOX mount -o rw,remount /system
	ui_print "Patching system's build prop for FUSE Passthrough..."
	patch_prop /system/build.prop "persist.sys.fuse.passthrough.enable" "true"
else
	ui_print "Ignoring FUSE Passthrough installation..."
	ui_print "Unsupported Android version or previously installed..."
fi

## AnyKernel boot install
dump_boot;
write_boot;

## end boot install
### end AnyKernel install
