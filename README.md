# 智能弹药课程设计作业
## <p align="center">弹箭飞行弹道模型仿真</p>

本项目使用Matlab进行弹箭飞行弹道模型的仿真。所使用的Matlab版本为R2022a，同时需要安装Simulink。

### <p align="center">无脉冲作用弹箭飞行弹道模型</p>

执行以下步骤进行仿真：

运行 beforesim.m 脚本。

运行 program_flight.slx Simulink模型。

运行 afterplot.m 脚本进行结果绘图。

<br>用户自定义配置

在 ProgramDynamics.m 的第69行按照注释赋予初始值。

### <p align="center">脉冲作用弹箭飞行弹道模型</p>

执行以下步骤进行仿真：

运行 beforesim.m 脚本。

运行 program_flight.slx Simulink模型。

运行 afterplot.m 脚本进行结果绘图。

<br>用户自定义配置

在 ProgramDynamics.m 的第69行按照注释赋予初始值。

在Beforesim.m 的第26行设置发动机作用位置。

在Program_flight.slx 的Pulsemodify子系统中修改Tm，Tj，Fp参数。 
![20230615172827](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/8fc830e5-8a88-4f90-870a-8b30cada427c)
![20230615172914](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/ef416761-5b10-45e5-acb9-8d68d6b34a7a)

在 program_flight.slx 的Pulsemodify子系统的 computeImpulseForce 函数第6行设置发动机级数。 
![20230615172946](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/e9a1008e-0d18-4ff2-bca6-0851e9518d83)

## 注意事项：

根据我获取的仿真结果，发动机在1-2000m的上升阶段还是会启动。尽管我的函数逻辑没有问题（判定条件是高度小于2000m且判定点领域积分为负，即下降段），但你也可以尝试使用其他算法。我个人不打算对这部分进行修改。

#6.15更新
哎，把积分判决改成微分判决就好了，果然微分比积分简单，哎
