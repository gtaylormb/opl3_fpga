Use DOSbox to run imfplay.exe

Launch DOSbox, mount this folder using:
mount d PATH_TO_THIS_FOLDER
d:
imfplay.exe DRO_FILE

To create filesystem.mfs, run:
mfsgen -c doom_000.dro

This can be loaded into memory at a specific location using JTAG prior to
starting program execution
