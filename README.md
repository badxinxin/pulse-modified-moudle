# 智能弹药课程设计作业
## <p align="center">弹箭飞行弹道模型仿真</p>

本项目使用Matlab进行弹箭飞行弹道模型的仿真。所使用的Matlab版本为R2022a，同时需要安装Simulink。

### <p align="center">无脉冲作用弹箭飞行弹道模型</p>

执行以下步骤进行仿真：

打开根目录\pulse-exclude。

运行 beforesim.m 脚本。

运行 program_flight.slx Simulink模型。

运行 afterplot.m 脚本进行结果绘图。

<br>用户自定义配置

在 ProgramDynamics.m 的第69行按照注释赋予初始值。

### <p align="center">脉冲作用弹箭飞行弹道模型</p>

执行以下步骤进行仿真：

打开根目录\pulse-exclude

运行 beforesim.m 脚本。

运行 program_flight.slx Simulink模型。

运行 afterplot.m 脚本进行结果绘图。

<br>用户自定义配置

在 ProgramDynamics.m 的第69行按照注释赋予初始值。

在Beforesim.m 的第26行设置发动机作用位置。

在Program_flight.slx 的Pulsemodify子系统中修改Tm，Tj，Fp，Engine，K参数。 

![20230615172827](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/cded5963-e879-4467-8a98-8a453a5f8f01)

## 6.15更新

哎，把积分判决改成微分判决就好了，果然微分比积分简单，哎

## 6.16更新

急晕了，老师说我求解器有问题解得是导数不是状态量，哎，但确实不是这个问题。

在模型的初始阶段，俯仰角的值并没有按照预期进行初始化。尽管在定义x0时为俯仰角设定了初始值，但Simulink仿真开始时，俯仰角的值却是0。

我尝试了多种方法进行调试，包括更改初始状态向量x0的顺序，查看S-function的调用路径，以及尝试在仿真开始之前查看俯仰角的值。然而，这些尝试并没有找到问题的根源。

然后，我对照上学期做的实际弹道模型，顺着俯仰角逐级检查，看到了S-function的输出向量模块的接口中alpha的顺序不对。alpha并没有被放在向量拆分器的最后，这可能是导致问题的原因。更改了alpha的顺序后，俯仰角终于不为0了。不过仿真结果开始耍宝了，俯仰角、wz和alpha在仿真过程中出现了大的振荡。

还好我有备份，我直接选择读档重做^ ^

知道问题所在了就直接去改向量顺序了，然后结果就是之前beta版本的锯齿波，很容易看出来是在脉冲力启动后产生的，需要对脉冲修正系统进行微调。

在使用scope观察输出脉冲力时，发现脉冲力在整个低于2000m的下落段一直在0和2000之间反复横跳，早就超过了预定的级数限制，于是想着优化一下判定启动次数的算法。

首先修改了函数的结构，将脉冲力的计算和脉冲次数的更新放在了同一个函数中。同时，添加了新的输入参数，包括发动机数量和脉冲次数。

然后，出现一个问题，即脉冲开始时间并不会随着时间的推移而增加。为了解决这个问题，引入了一个新的输入参数dt，表示仿真的时间步长，并用它来更新脉冲开始时间。

~~最后，我注意到，在飞行器开始下降且高度低于2000m的时候，脉冲计数算作一次了，可能会导致发动机少作用一次。为了解决这个问题，使用memory模块将初值设为-1，这样刚进入2000m时判定条件完成加1，进入循环时刚好为0，可以启动发动机。~~

## 6.16晚更新

我是铸币，龙格库塔法步长是0.001s，Tm和Tj填的还是s的单位，对着表格看了半天跑去改了半天函数，结果是单位问题，直接填毫秒就行了。

![20230616215115](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/3b1056da-ff8c-4417-9fac-91b9d8496f4d)

## 6.18晚更新

历史上最黑暗的一天，图画完才看到跟个铸币一样把角速度也乘57.3（弧度转角度）了呃呃，白忙活半天。

![20230618225251](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/11c3c19e-8be3-4f9d-96b7-fac909a25516)

还有更恶心的，弹道倾角和攻角曲线都是对的，结果弹道倾角在施加脉冲力的时候增加的不是度数而是弧度，俯仰角速度也是对的，俯仰角=攻角+弹道倾角，matlab你自己看看这也不等啊。

![20230618230050](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/8d969663-1fa8-4d8e-a67d-1cba077f0b46)

在程序框图里找了半天，也没发现在哪里有这个57.3的倍率乘上去了，要是想找到原因估计得重新做整个闭环系统了，秉着代码能跑就不修改的原则。

在我肯定运动方程组正确的前提下，把控制力矩除以了57.3，虽然我也不知道这是什么含义，这下出的图貌似才是正确的，难道他真的是天才？

![20230618230808](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/b834e6e7-f2d8-405e-8466-26bfff42d924)

![20230618230916](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/a80c37be-a04e-4c73-8c7c-9690c68ff9a1)

这下应该是完整版的咯。

## 6.20更新

放了两个画图的函数出来，自己根据注释微调一下就能画对比曲线和拟合修正能力了。

把每次simulink的模拟结果，6组数据另存到当前目录下，名字自己取，画图的时候需要对应名字才能检索到文件。

![20230620122453](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/dd62d514-2173-4280-80c2-309e9d54cbed)

我保存好后的数据为：

![20230620121443](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/30713966-2652-4b91-a086-def212dbac4b)

每个人的都有点差异，我上传的代码画的图就是这样：

![20230620121754](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/f50eedae-f985-400d-9560-f86d13868d61)

画修正能力的曲线，需要在方案弹道里把每个参数下的落点X标出来，然后填到y里。

![20230620122208](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/9f7d85af-a4d8-425d-8a7e-31ed86dd5483)
![20230620122233](https://github.com/badxinxin/pulse-modified-moudle/assets/131271278/1ff84b50-a823-48e3-8eb6-4e1d0faf8bad)

为了便于操作，我把减去自由弹道落点的步骤写在代码里了，这样纵轴就直接是修正距离了。改一改x坐标和横纵轴的注释运行作图就ok了。

# 求求用完给我点个星星，这对我很重要！
