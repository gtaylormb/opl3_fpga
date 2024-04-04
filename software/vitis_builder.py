# 2024-04-02T20:34:45.663223
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_project")

platform = client.create_platform_component(name = "opl3_platform",hw = "fpga/build/opl3.xsa",os = "standalone",cpu = "ps7_cortexa9_0")

comp = client.create_app_component(name="imfplay_port",platform = "vitis_project/opl3_platform/export/opl3_platform/opl3_platform.xpfm",domain = "standalone_ps7_cortexa9_0")

comp = client.get_component(name="imfplay_port")
status = comp.import_files(from_loc="software/src", files=["audio_demo.cpp", "audio_demo.h", "global.h", "imfplay.cpp", "imfplay.h", "main.cpp", "mfs_filesys.c", "mfs_filesys_util.c", "timer_ps.cpp", "timer_ps.h", "xilmfs.h"], dest_dir_in_cmp = "src")

platform = client.get_platform_component(name="opl3_platform")
status = platform.build()

comp.build()
