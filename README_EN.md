# Non-GKI Kernel with KSU and SUSFS
![GitHub branch check runs](https://img.shields.io/github/check-runs/JackA1ltman/NonGKI_Kernel_Build/main)![GitHub Downloads (all assets, latest release)](https://img.shields.io/github/downloads/JackA1ltman/NonGKI_Kernel_Build/latest/total)  
[Supported Devices](Supported_Devices.md) | [中文文档](README.md) | English  

**Non-GKI**: What we commonly refer to as Non-GKI includes both GKI1.0 (kernel versions 4.19-5.4) (5.4 is QGKI) and true Non-GKI (kernel versions ≤ 4.14).  

Due to severe fragmentation in Non-GKI kernels, which not only prevents universal compatibility but also results in inconsistent build environments—including but not limited to system versions, GCC versions, and Clang versions—we have decided to start an automated Non-GKI kernel compilation project.  
This project welcomes forks for personal modifications, contributions through pull requests, and collaborations.  

# Usage Example
## Profiles/DeviceCodename_ROMName.env
Each profile consists of the following elements:  
**CONFIG_ENV** - Specifies the exact configuration file location within the Action environment.  

**DEVICE_NAME** - Full device name, format: Brand_Model_Region  
**DEVICE_CODENAME** - Device codename.  

**CUSTOM_CMDS** - Typically used to specify the compiler/alternative compiler.  
**EXTRA_CMDS** - Custom parameters required by the compiler.  

**KERNEL_SOURCE** - Location of the kernel source code.  
**KERNEL_BRANCH** - The required branch of the kernel source.  

**CLANG_SOURCE** - Location of Clang (supports git, tar.gz, tar.xz).  
**CLANG_BRANCH** - Required branch for Clang (only applicable if using git).  

**GCC_GNU** - If your kernel requires GCC but does not need a custom GCC, you can enable the system-provided GNU-GCC with true or false.  
**GCC_XX_SOURCE** - Location of GCC (supports git, tar.gz, zip).  
**GCC_XX_BRANCH** - Required branch for GCC (only applicable if using git).  

**DEFCONFIG_SOURCE** - If you need a custom DEFCONFIG file, provide the specific file path.  
**DEFCONFIG_NAME** - The required DEFCONFIG file for compilation, usually formatted as device_defconfig or vendor/device_defconfig.  

**KERNELSU_SOURCE** - You can specify the source of KernelSU. By default, it uses setup.sh, but if necessary, manual installation can be enabled (in which case, this should be a git repository).  
**KERNELSU_BRANCH** - The branch of KernelSU to use.  
**KERNELSU_NAME** - Some KernelSU branches have different names, so you must specify the correct name. The default is KernelSU.  

**SUSFS_ENABLE** - Whether to enable SUSFS during compilation (true or false).  
**SUSFS_FIXED** - Whether to apply additional patches to fix SUSFS-related issues during kernel compilation.  

**AK3_SOURCE** - Location of AnyKernel3 (if needed, only supports git).  
**AK3_BRANCH** - Required branch for AnyKernel3.  

**BOOT_SOURCE** - If you have enabled MKBOOTIMG packaging, specify the location of the original clean kernel image (must be in .img format).  

**LXC_ENABLE** - (Experimental ⚠) Enable automated kernel support for LXC/Docker (true or false).  

**HAVE_NO_DTBO** - (Experimental ⚠) If your kernel does not provide a dtbo.img but your device uses an A/B partitioning scheme with a dtbo partition, you can enable this option (true). The default is false.  

**ROM_TEXT** - Used in the final filename of the compiled kernel to indicate which ROM it is compatible with.  

## .github/workflows/build_kernel_Device_Model_ROM_AndroidVersion.yml
We have provided example .env and .yml files for compilation. Below is an overview of the .yml structure.  
Only key configurable sections are highlighted; modifying steps and sequences extensively is not recommended.  
These are the example files we provide: **codename_rom_template.env** and **build_kernel_template.yml**.  

- **env:** - Define essential variables independently from the Profiles configuration.
    - **PACK_METHOD** - Packaging method, either MKBOOTIMG or [Anykernel3](https://github.com/osm0sis/AnyKernel3) (default: Anykernel3).
    - **KERNELSU_METHOD** - The method for embedding KernelSU:
        - The default is "**shell**". 
        - If setup.sh is not used or encounters errors, change this to "**manual**". Although manual means manual installation, no manual intervention is required.
        - If your kernel already has KernelSU but you want to replace it, you can use "**only**" to execute Git operations without applying patches.
    - **PATCHES_SOURCE** - SUSFS typically requires manual patches. Provide the GitHub repository URL containing the patches. If you are not using SUSFS, this can be left blank.
    - **PATCHES_BRANCH** - The required branch for the patch repository (default: main).
    - **HOOK_METHOD** - Two KernelSU patching methods are available:
        - **normal**: Standard patching, works in most cases.
        - [vfs](https://github.com/backslashxx/KernelSU/issues/5): Minimal patching method, which may improve hiding KernelSU but might cause ISO compliance issues with older Clang versions，And there are issues with support for kernels ≤4.9. It is recommended to enable this only for higher kernel versions.
    - **PROFILE_NAME** - Enter the name of your modified ENV environment variable file, such as codename_rom_template.env.
    - **KERNELSU_SUS_PATCH** - If your KernelSU is not part of KernelSU-Next and does not have a patch branch for SuSFS, you can enable this option (true). However, we do not recommend doing so, as the KernelSU branches have been heavily modified, and manual patching is no longer suitable for the current era.

- **runs-on:** ubuntu-XX.XX 
    - Different kernels may require different Ubuntu versions. The default is 22.04, but support for both 22.04 and 24.04 is available. The system version determines which package installation method is used.

- **Set Compile Environment**
    - If no GCC is needed, Clang-only compilation is selected automatically.
    - If GCC is needed, both 64-bit and 32-bit versions must be specified. The recommended format is git, but tar.gz and zip are also supported.
    - Clang sources can be in git, tar.gz, tar.xz, zip, or managed via antman.

- **Get Kernel Source**
    - Normally, kernel source code can be obtained via Git, so modifications are generally unnecessary.
    - Some smartphone manufacturers have questionable practices—they open source the code, but it's pre-packaged, or they separate drivers from the kernel source. As a result, you may need to modify this part yourself.
    
- **Set Pack Method, KernelSU, and SUSFS**
    - **Anykernel3** - If AnyKernel3 is not found in the kernel source, the one specified in env is used. Only git is supported.
    - **MKBOOTIMG** - Requires a clean kernel image. The recommended method is using a GitHub raw URL.

- **Extra Kernel Options**
    - Some kernels require additional settings during compilation. 
    - If your kernel does not, you can comment out this section.

- **Added mkdtboimg to kernel (Experimental)**
    - Most kernels do not need this feature. Some kernels, like Nameless, lack dtbo.img but do not require it.
    - This is only applicable to A/B partition devices. Enabling this could make the device unbootable, so proceed with caution.

- **Setup LXC (Experiment)**
    - Enables LXC support automatically. However, many kernels do not support this method.
    - This is mainly for testing and is not used in official builds.

- **Patch Kernel**
    - Two types of patches are included: SUSFS patches and additional kernel patches.
    - Whether these patches are applied depends on SUSFS_ENABLE and SUSFS_FIXED settings in the env.
    - SUSFS patching may cause issues, requiring additional fixes (under Fixed Kernel Patch).

Final Reminder⚠ : Unless otherwise mentioned, there is no need to modify any other sections of the .yml workflow. The setup is designed to automatically handle various conditions.
