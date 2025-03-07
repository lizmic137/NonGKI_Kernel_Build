# Non-GKI Kernel with KSU and SUSFS
![GitHub branch check runs](https://img.shields.io/github/check-runs/JackA1ltman/NonGKI_Kernel_Build/main)![GitHub Downloads (all assets, latest release)](https://img.shields.io/github/downloads/JackA1ltman/NonGKI_Kernel_Build/latest/total)  
Automatic build Non-GKI Kernel with KSU and SUSFS  
*Non-GKI：我们常说的Non-GKI包括了GKI1.0（内核版本4.19-5.4）和真正Non-GKI（内核版本≤4.14）  
由于Non-GKI内核存在严重的碎片化，不仅仅体现在内核无法通用，更是存在编译环境参差不齐，包括但不限于系统版本，GCC版本，Clang版本等等，因此决定开始自动化编译Non-GKI内核项目  
本项目欢迎Fork后自行编辑使用，也欢迎增加修改后提交合并，或者成为合作伙伴  

# 使用例
## Profiles/设备代号_ROM名称.env
总共由以下内容组成：  
**CONFIG_ENV** - 用来表明在Action环境中具体配置文件位置  

**DEVICE_NAME** - 设备全称，格式：设备品牌_型号_地区  
**DEVICE_CODENAME** - 设备代号  

**CUSTOM_CMDS** - 通常用于指明所用编译器/备用编译器  
**EXTRA_CMDS** - 通常用于编译器所需的自定义参数  

**KERNEL_SOURCE** - 内核源码所在之处  
**KERNEL_BRANCH** - 内核源码所需分支  

**CLANG_SOURCE** - Clang所在之处，但支持git、tar.gz、tar.xz  
**CLANG_BRANCH** - Clang所需分支，但前提是git  

**GCC_GNU** - 若你的内核需要GCC，但不需要自定义GCC，可通过选项启用系统提供的GNU-GCC，true或false  
**GCC_XX_SOURCE** - GCC所在之处，但支持git、tar.gz、zip  
**GCC_XX_BRANCH** - GCC所需分支，但前提是git  

**DEFCONFIG_SOURCE** - 若有自定义DEFCONFIG文件需求可提供具体文件所在地址  
**DEFCONFIG_NAME** - 不管是否自定义，都需要提供用于编译的必要DEFCONFIG文件，通常格式为：设备_defconfig、vendor/设备_defconfig  

**KERNELSU_SOURCE** - 你可以自行设定KernelSU的来源，通常情况下是setup.sh。但有需求可启用手动安装的方式，此时则为git  
**KERNELSU_BRANCH** - 提供KernelSU的所属分支  
**KERNELSU_NAME** - 部分KernelSU分支存在不同的名称，所以你需要填写正确名称，默认为KernelSU  

**SUSFS_ENABLE** - 是否在编译时启用SUSFS，true或false  
**SUSFS_FIXED** - 是否启用SUSFS错误修补，一般用于内核修补时产生错误后，二次补充修补  

**AK3_SOURCE** - Anykernel3所在之处，若需要的话，仅支持git  
**AK3_BRANCH** - Anykernel3所需分支  

**BOOT_SOURCE** - 若你已经启用MKBOOTIMG的方式，要填写原始干净内核的地址，仅限img格式  

**LXC_ENABLE** - (实验性⚠)启用自动化内核LXC/Docker支持，true或false  

**HAVE_NO_DTBO** - (实验性⚠)若你的内核没有提供dtbo.img，且你的设备属于A/B分区且存在dtbo分区，则可启用本选项(true)，默认为false  

**ROM_TEXT** - 用于编译成功后用于上传文件标题，声明内核可用的ROM  

## .github/workflow/build_kernel_设备简称_型号_ROM_Android版本.yml
我们编写了env和用于编译的yml的例本，接下来是对yml例本的解析  
这里仅指出大概可供修改的地方，具体可按需求修改，我们不建议过度修改步骤和顺序  

- **runs-on: ubuntu-XX.XX** - 不同内核所需系统不同，默认为22.04，我们预先提供了两套包安装选项（适配22.04和24.04），我们通过检测系统版本进行决定包安装  

- **Set Compile Environment**
  - 这里分为无GCC和有GCC，Clang也有区分判定，请继续往下看
  - 若无GCC，则会自动选择仅Clang，而通常情况下，仅Clang可用于使用antman进行管理的Clang，这些步骤我们都已经可以自动识别，因此不需要修改yml来实现
  - 若有GCC，则需填写GCC 64位和32位的版本，对于GCC我们建议git形式，但同时支持tar.gz和zip
  - 根据本人的使用情况，我们对于Clang支持为git、tar.gz、tar.xz、zip以及上述提到的antman管理软件

- **Set Pack Method and KernelSU and SUSFS**
  - 我们默认提供Anykernel3和MKBOOTIMG两种打包方式，其中AK3可以自动检测内核源码中是否存在，若不存在则调用env提供的SOURCE和BRANCH，对于AK3仅提供git方式，MKBOOTIMG由我们默认提供，一般不需要自行获取
  - 有关KernelSU，我们提供了执行setup.sh一键脚本的方式，但我们在一次意外中发现该脚本在某些环境下会出现git错误，因此我们提供了手动安装的方式。虽然是手动安装，但实际上并不需要维护者修改任何内容
  - yml文件中变量PACK_METHOD和KERNELSU_METHOD分别对应，打包方式（条1）和KernelSU调用方式（条2），变量可设定值参考yml文件对应位置

- **Extra Kernel Options** - 有些内核编译时需要提供更多设置项  

- **Patch Kernel**
  - 分为两个部分，主要的SUSFS修补和补充修补
  - 一切基于env中SUSFS_ENABLE和env.SUSFS_FIXED为true，但不一定都为true
  - SUSFS修补大概率会产生问题，因此通常情况下需要补充修补
  - 在Set Pack Method and KernelSU and SUSFS步骤中，涉及到一个变量KERNEL_PATCHES，用于指向你的用于patch的git项目，可参考我的用于Patch的git项目
  - 补充修补需要执行你重新制作的patch补丁

- **Make [Pack Method]**
  - 这一步分为AK3和MKBOOTIMG，受到Set Pack Method and KernelSU and SUSFS步骤中的变量控制，若无特殊需要，请使用我们提供的打包方案即可
  - ~~MKBOOTIMG的方式可能会导致无法启动设备，我们对此有疑问，所以若可行尽可能使用AK3方式~~我们已经修正了该问题，现在该功能完全正常
  - MKBOOTIMG需要提供干净的原始内核镜像文件，我们建议使用Github raw地址
