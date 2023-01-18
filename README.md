# Device Tree for OnePlus Nord N10 5G for OrangeFox

## Compile
To build, execute this command:
```
. build/envsetup.sh; export ALLOW_MISSING_DEPENDENCIES=true; export LC_ALL=C; lunch ofox_billie-eng; make -j$(nproc --all) recoveryimage
```

To test it:
```
# To temporarily boot it:
fastboot boot out/target/product/billie/recovery.img 

# You can flash the recovery with:
fastboot flash recovery recovery.img
```

Kernel: https://github.com/LineageOS/android_kernel_oneplus_sm6350

##### Credits
- Wishmasterflo for the OnePlus 8 modified device tree
- ApexLegend007 for Android 12.1 device Tree
- The-Incognito for Recovery Trees of Oneplus 8T
- YumeMichi For Implementing Erofs and Other Misc
- bigbiff for decryption
- Pranav Talmale for decryption
- Systemad for original tree
- CaptainThrowback for original tree
- mauronofrio for original tree
- TWRP team
- OrangeFox team
- Qnorsten for OOS fix
