% 定义你的四个点
x = [0,150,200,400];
y = [9302.66, 9303.61, 9303.93, 9304.97];  % 修正落点
subtract_value = 9172.32;  % 减去自由落点

% 计算修正能力
y_new = y - subtract_value;

% 画散点图
scatter(x, y_new, 'filled')
xlabel('脉冲发动机作用与质心距离/mm')  % X轴含义
ylabel('修正能力/m')  % Y轴含义

% 进行线性拟合
p = polyfit(x, y_new, 1);  % 1代表线性拟合

% 根据拟合结果画线
hold on  % 保持当前图像，继续在上面画图
plot(x, polyval(p, x), 'r-')  % 画出拟合的直线
hold off  % 解除保持
