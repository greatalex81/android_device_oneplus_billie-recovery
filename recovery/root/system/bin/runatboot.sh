# automatically set device props for unified tree shared-hardware models/variants

resetprop "ro.build.product" "OnePlusN10"
resetprop "ro.display.series" "OnePlus Nord N10 5G"
resetprop "ro.product.device" "OnePlusN10"
resetprop "ro.product.model" "BE2026"
resetprop "ro.product.name" "OnePlusN10"
resetprop "ro.product.odm.device" "OnePlusN10"
resetprop "ro.product.odm.model" "BE2026"
resetprop "ro.product.odm.name" "OnePlusN10"
resetprop "ro.product.product.device" "OnePlusN10"
resetprop "ro.product.product.model" "BE2026"
resetprop "ro.product.product.name" "OnePlusN10"
resetprop "ro.product.system.device" "OnePlusN10"
resetprop "ro.product.system_ext.device" "OnePlusN10"
resetprop "ro.product.system_ext.model" "OnePlusN10"
resetprop "ro.product.system_ext.name" "qssi"
resetprop "ro.product.vendor.device" "OnePlusN10"
resetprop "ro.product.vendor.model" "BE2026"
resetprop "ro.product.vendor.name" "OnePlusN10"
resetprop "ro.product.system.brand" "OnePlus"
resetprop "ro.product.system.manufacturer" "OnePlus"
resetprop "ro.product.system.model" "BE2026"
resetprop "ro.product.system.name" "OnePlusN10"

echo "Setting device props for OnePlusN10" >> /tmp/recovery.log

exit
