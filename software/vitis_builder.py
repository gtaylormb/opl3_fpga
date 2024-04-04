# 2024-04-02T20:34:45.663223
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_project")

platform = client.create_platform_component(name = "opl3_platform",hw = "fpga/build/opl3.xsa",os = "standalone",cpu = "ps7_cortexa9_0")

comp = client.create_app_component(name="imfplay_port",platform = "vitis_project/opl3_platform/export/opl3_platform/opl3_platform.xpfm",domain = "standalone_ps7_cortexa9_0")

comp = client.get_component(name="imfplay_port")
status = comp.import_files(from_loc="/home/gtaylor/git/opl3_fpga/software", files=["src"])

platform = client.get_platform_component(name="opl3_platform")
status = platform.build()

comp.build()
