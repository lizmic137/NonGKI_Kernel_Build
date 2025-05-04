**Only Chinese:**  
| 设备名称 | 设备代号 | 内核/作者/名称 | 系统 | Android | 打包方式 | KernelSU | SuSFS | LXC | VFS Hook | KPM | Re:Kernel | 维护状态 |  
|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|----------|  
| 一加 8  | instantnoodle | 4.19/ppajda/XTD | OxygenOS/ColorOS 13.1 | 13 | AnyKernel3 | Magic | ✅ | ❌ | ❌ | ❌ | ❌ | Stable |  
| 一加 8  | instantnoodle | 4.19/Nameless/Nameless | Nameless 15 | 15 | AnyKernel3 | rsuntk | ✅ | ❌ | ❌ | ❌ | ❌ | Beta |  
| 一加 8  | instantnoodle | 4.19/Rohail33/Realking | OxygenOS/ColorOS 13.1 | 13 | AnyKernel3 | SukiSU(U) | ✅ | ❌ | ❌ | ❌ | ✅ | Suspend |  
| 小米 MIX2S  | polaris | 4.9/EvoX/EvoX | Evolution X 10.2.1 | 15 | Boot Image | SukiSU(U) | ✅ | ❌ | ❌ | ❌ | ❌ | Stable |  
| 红米 K20 Pro  | raphael | 4.14/SOVIET-ANDROID/SOVIET-STAR-OSS | Based-AOSP | 15 | AnyKernel3 | rsuntk | ✅ | ❌ | ❌ | ❌ | ❌ | Stable |  
| 红米 Note 4X  | mido | 4.9/RaidenShogunSeggs/(Nothing) | Based-AOSP | 13 | AnyKernel3 | Next | ✅ | ❌ | ❌ | ❌ | ❌ | Suspend |  
| 黑鲨 4 | penrose | 4.19/DtHnAme/(Nothing) | MIUI/JoyUI 12 | 11 | AnyKernel3 | Magic | ❌ | ❌ | ❌ | ❌ | ❌ | Stable |  
| 小米 10S | thyme | 4.19/TIMISONG-dev/MagicTime | Based-AOSP | 15 | AnyKernel3 | rsuntk | ✅ | ❌ | ❌ | ❌ | ❌ | Stable |  
| 中兴 A201ZT | a201zt | 4.19/官方内核 | 未知 | Null | AnyKernel3 | Next | ❌ | ❌ | ❌ | ❌ | ❌ | Suspend |  
| 三星 S20 5G | x1q | 4.19/官方内核 | OneUI 5.1/6.1 | 13/14 | Boot Image | rsuntk | ❌ | ❌ | ❌ | ❌ | ❌ | Beta |  
| 红米 Note 7 | lavender | 4.4/Stormbreaker/Predator | MIUI 12 | 10 | Boot Image | rsuntk | ❌ | ❌ | ❌ | ❌ | ❌ | Suspend |  
| 小米 5 | gemini | 4.4/crdroidandroid/crdroid | Crdroid 9 | 13 | Anykernel3 | rsuntk | ❌ | ❌ | ❌ | ❌ | ❌ | Suspend |  
| 谷歌 Pixel 9 Series | zumapro | 6.1/kerneltoast/kerneltoast | Pixel | 15 | Anykernel3 | SukiSU | ✅ | ❌ | ❌ | ❌ | ❌ | Suspend |  
| 小米 11 Ultra | star | 5.4/EndCredits/Acetaminophen | HyperOS | 14 | Anykernel3 | Magic | ✅ | ❌ | ❌ | ❌ | ❌ | Suspend |  
| 小米平板 4(Plus) | clover | 4.19/pix106/SouthWest | LineageOS 22.1 | 15 | AnyKernel3 | SukiSU(U) | ✅ | ❌ | ❌ | ✅(🤔) | ❌ | Beta |  

特别说明：
  - 我们提供的KernelSU分支包括：[Next(❌)](https://github.com/KernelSU-Next/KernelSU-Next)、[Magic](https://github.com/backslashxx/KernelSU)、[rsuntk](https://github.com/rsuntk/KernelSU)、[lightsummer233](https://github.com/lightsummer233/KernelSU)、[酷友二创-SukiSU-Ultra](https://github.com/ShirkNeko/SukiSU-Ultra)、[SukiSU](https://github.com/ShirkNeko/KernelSU)
  - 打包方式：Anykernel3请在Recovery下刷入，Boot Image请在Recovery/Fastboot下选择刷入Boot分区
  - 部分机型由于内核问题将暂停（Suspend）维护，但仍可通过Action的方式Fork后自行编译
  - VFS Hook支持rsuntk、Magic、Next，其他分支可能无法支持，经测试SukiSU无法支持
  - 内核通常为全版本可用，除非特殊声明
  - LineageOS 内核 需要在repo完整源代码的环境下编译，否则可能会导致无法开机，因此我们不会考虑官方维护LineageOS内核
  - 一加8 OxygenOS/ColorOS 13.1 经测试8、8t、8Pro、9r都可用，且该内核类原生设备同样可用（但会有某些Bugs）
  - 红米 Note 4X 通常仅**高通**可用，联发科设备不支持
  - 黑鲨4 因机型内核缺陷（缺少ANDROID_KABI）无法修补SuSFS，为了提高隐藏性和安全性，因此是首款将常规手动Hook切换至[VFS Hook](https://github.com/backslashxx/KernelSU/issues/5)的设备
  - 一加8 Nameless 15 ~~存在WiFi失效的问题，请谨慎刷入~~我们更换defconfig文件后解决该问题，但目前仍在测试阶段
  - 中兴 Z201ZT 由于源代码并非Git方式获得，因此修改了yml文件中对应的获取方式，由于存在较多未知信息，因此该内核仅研究学习使用，若有需要可自行Fork编译
  - 三星 S20 5G 仅支持**高通版本**，猎户座版本请勿尝试
  - 红米 Note 7 需要在内核刷入后再刷入[Oldcam+WiFi补丁](https://sourceforge.net/projects/syylg/files/MengT/MIUI_Q_PATCH/OldCam%2BWiFi-Patch-v2.zip/download)才能正常使用
  - 谷歌 Pixel 9 Series 指 9代全系列设备，该内核目前尚未经过测试
  - 小米 11 Ultra 没有进行normal patch，仅仅执行backport patch，因此应该可以在KSU管理器中切换kprobe和模拟手动修补，以及SUS SU应该也能正常工作
  - 🤔小米平板 4(Plus) 基于SukiSU Ultra的KPM功能**未经完整测试**（会显示在管理器中，但未刷入内核模块进行测试）
