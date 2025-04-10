## 项目更新日志
- **Ver.1.4 Fixed 9**
    - 增加 一加8 Realking 移除自带no-kprobe patch
    - 切换 一加8 Realking no-kprobe 至 VFS
    
- **Ver.1.4 Fixed 8**
    - 修正 支持列表 显示错误
    
- **Ver.1.4 Fixed 7**
    - 为 支持列表 增加 Re:Kernel、KPM 显示
    - 为 一加8 Realking 增加 Re:Kernel 支持
    - 将 一加8 Realking KernelSU分支切换至magic

- **Ver.1.4 Fixed 6**
    - 增加 部分patch补丁 对已存在修补的判定

- **Ver.1.4 Fixed 5**
    - 增加 说明文件 对 Proton Clang 13 的说明
    - 修改 支持列表 和 发布列表 对部分机型的描述
    - 调整 Clang 相关的部分判定顺序

- **Ver.1.4 Fixed 4**
    - 修正 KPM Patcher 部分执行内容
    - 增加 KPM Patcher 部分判定

- **Ver.1.4 Fixed 3**
    - 修正 说明文件 部分文本

- **Ver.1.4 Fixed 2**
    - 增加 谷歌Pixel 9 Series 设备
    - 对 Arch Linux 示例YAML 增加rustup
    - 增加 支持列表 部分词条

- **Ver.1.4 Fixed 1**
    - 修正 小米5 YAML的标题错误

- **Ver.1.4**
    - 增加 生成DTBO 的新方法
    - 增加 SukiSU-Ultra KPM 注入功能（有限）
    - 增加 基于Arch Linux 的 新版示例YAML
    - 增加 说明文件 对Arch Linux YAML的说明
    - 调整 安装GNU GCC 的顺位
    - 修改 发布Tag至 1.4-r1
    - 切换 小米5 KernelSU分支至rsuntk
    - 切换 小米5 至 Arch Linux YAML
    - 删除 打包Anykernel3 中自动转换Image成Image.gz的部分

---

- **Ver.1.3 Fixed 26**
    - 修正 backport、normal、extra 脚本潜在的对4.4设备的判定错误
    - 该项目补丁将是当前大版本的最后一次补丁

- **Ver.1.3 Fixed 25**
    - 添加 小米5 Crdroid 设备
    - 修正 合并CONFIG 功能的执行错误

- **Ver.1.3 Fixed 24**
    - 修正 说明文件 对获取DEFCONFIG步骤的说明
    - 更新 一加8 OOS13 的KernelSU分支
    
- **Ver.1.3 Fixed 23**
    - 修正 生成DTB 步骤中遇到的潜在错误

- **Ver.1.3 Fixed 22**
    - 删除 小米Mix2s 设备中实验性启用 SukiSU-Ultra KPM 的内容
    - 增加对 SukiSU-Ultra KPM 功能的判断

- **Ver.1.3 Fixed 21**
    - 增加 生成DTB 功能至MKBOOTIMG步骤
    - 增加 合并CONFIG文件 功能
    - 增加 说明文件 中对 合并CONFIG文件 功能的说明
    - 修改 说明文件 中对 生成DTB 功能的说明
    - 修正 示例yaml文件 中对部分变量错误调用的问题
    - 增加编译时对仅GCC编译的判断

- **Ver.1.3 Fixed 20**
    - 增加 生成DTB 功能
    - 增加 说明文件 中对 生成DTB 功能的说明

- **Ver.1.3 Fixed 19**
    - 为 一加8 Nameless15 yaml文件移植自动获取defconfig功能

- **Ver.1.3 Fixed 18**
    - 修改 支持列表 和 发布列表 中SukiSU指向的Github项目至SukiSU-Ultra
    - 修改 小米Mix2s 中对SukiSU的KernelSU源和分支指向

- **Ver.1.3 Fixed 18**
    - 删除 小米8（dipper） MIUI Android 10 设备
    - 增加 说明文件 中PYTHON_VERSION对强制执行 Python2 方法的说明
    - 增加 英文说明文件 中缺失的项目

- **Ver.1.3 Fixed 17**
    - 增加 说明文件 KERNELSU_METHOD 的解释
    - 对 小米8 产生的问题进行修正

- **Ver.1.3 Fixed 16**
    - 将 红米 Note7Pro(lavender) 打包方式修改成MKBOOTIMG
    - 增加 小米8(dipper) MIUI Android 10
    - 修改 Clang 在yaml示例文件中若未设置而产生的提示语
    - 删除 testing yaml示例文件

- **Ver.1.3 Fixed 15**
    - 回滚 系统版本 设置

- **Ver.1.3 Fixed 14**
    - 增加 一加8 Realking OOS13.1 设备
    - 修改 BUILD_DEBUGGER 中 cat命令的输出

- **Ver.1.3 Fixed 13**
    - 调整 发布页面 和 支持列表 部分文字大小写
    - 将 发布Tag 版本号递增规则调整回来
    - 修复 SukiSU 版本号获取问题

- **Ver.1.3 Fixed 12**
    - 更改 发布标签 版本号为默认
    - 修正 VFS补丁 判定范围模糊的问题

- **Ver.1.3 Fixed 11**
    - 修复 红米 K20Pro 采用手动Hook时产生的编译错误
    - 修复 黑鲨 4 编译时无法找到新补丁的问题
    - 修复 一加8 Nameless 15 编译时提示重复定义的问题

- **Ver.1.3 Fixed 10**
    - 将 一加8 Nameless 15 切换为KernelSU-rsuntk
    - 将 红米 K20 Pro 切换为KernelSU-rsuntk
    - 将 黑鲨 4 切换为KernelSU-rsuntk
    - 将 小米 10S 切换为KernelSU-rsuntk

- **Ver.1.3 Fixed 9**
    - 增加说明页面中对切换KernelSU分支的内容
    - 更正分支mksu-skn的名称为SukiSU
    - 修正 支持列表 和 发布列表 中对 小米Mix2s 设备对KernelSU分支的描述

- **Ver.1.3 Fixed 8**
    - 修正 小米 Mix2s 对新补丁的执行
    - 修正发布用yaml存在的缺失

- **Ver.1.3 Fixed 7**
    - 去掉说明文件中版本号对小版本的显示
    - 尝试性的为 小米 Mix2s 进行KernelSU分支的迁移
    - 在发布列表中增加 一加Nameless 15 以及 三星 S20 5G（高通版），并将其在支持列表中更正为Beta

- **Ver.1.3 Fixed 6**
    - 为 三星 S20 5G（高通版） 修正yaml文件名称，并修改其所使用的KernelSU分支，和修改其对应的支持列表说明
    - 调整示例文件中，对新补丁执行的判定，以防止未按计划执行新补丁的情况
    - 调整了支持设备中部分设备说明

- **Ver.1.3 Fixed 5**
    - 修正示例文件中对新补丁的调用错误问题
    - 修改了支持列表中部分机型的解释说明

- **Ver.1.3 Fixed 4**
    - 为 红米Note 7(lavender) 设备修改内核源码地址，同时修改了支持设备列表相关内容

- **Ver.1.3 Fixed 3**
    - 修正说明内容中排版错误的地方

- **Ver.1.3 Fixed 2**
    - 修正说明内容中的版本号部分

- **Ver.1.3 Fixed 1**
    - 增加了对补丁适用性的声明
    - 增加了用于KernelSU反向移植的补丁，并添加了对补丁的执行
    - 将更新发布Tag切换成1.3
    - 修正了示例文件中此前不完善的内容
    - 停止对KernelSU-Next的支持，当前维护设备至多维护2个版本后就会更换KernelSU分支，这项决策对自行Fork的用户不受影响，我们不会删除协助执行或判断KernelSU-Next分支的相关代码
    
- **Ver.1.3**
    - 修正了系统在应对仅Gcc编译时，无法如期切换至仅Gcc的问题
    - 增加了切换Ubuntu系统版本的相关变量和代码
    - 增加了切换Python2的相关变量和代码
    - 增加了解析Image文件包含的defconfig的功能
    - 增加了build debugger功能，该功能目前支持展示patch错误的文件
    - 切换一加8 nameless 15所需defconfig
