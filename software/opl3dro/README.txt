Use DOSbox to run imfplay.exe

Launch DOSbox, mount this folder using:
mount d PATH_TO_THIS_FOLDER
d:
imfplay.exe DRO_FILE

To create filesystem.mfs, run:
mfsgen -c *.dro

This can be loaded into memory at a specific location using JTAG or bootloader 
prior to starting program execution (I assume 0x10000000 in the imfplay code).
