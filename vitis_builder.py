# 2024-04-02T19:14:08.684907
import vitis

client = vitis.create_client()
client.set_workspace(path="vitis_sw_project")

platform = client.create_platform_component(name = "opl3_hw_platform",hw = "fpga/build/opl3.xsa",os = "standalone",cpu = "ps7_cortexa9_0")
comp = client.create_app_component(name="imfplay_port",platform = "vitis_sw_project/opl3_hw_platform/export/opl3_hw_platform/opl3_hw_platform.xpfm",domain = "standalone_ps7_cortexa9_0")

platform.build()
comp.build()

