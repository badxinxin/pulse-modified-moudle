%从simulink结果获取数据
x_data = x.Data;
y_data = y.Data;
v_data = v.Data;
theta_data = theta.Data*180/pi;
alpha_data = alpha.Data*180/pi;
omegaz_data = omegaz.Data*180/pi;
theta_dot_data = theta_dot.data*180/pi;
time = x.Time;

%画图
figure(1)
plot(x_data,y_data,'LineWidth',1.5,'Color','blue')
xlabel('X [m]');ylabel('Y [m]');
title('方案弹道')

figure(2)
plot(time,v_data,'LineWidth',1.5,'Color','red')
xlabel('t [s]');ylabel('v [m/s]');
title('速度随时间变化曲线')

figure(3)
plot(time,alpha_data,'LineWidth',1.5,'Color','red')
xlabel('t [s]');ylabel('攻角 [°]');
title('攻角随时间变化曲线')

figure(4)
plot(time,theta_data,'Linewidth',1.5,'Color','red')
xlabel('t[s]');ylabel('俯仰角 [°]');
title('俯仰角随时间变化曲线')

figure(5)
plot(time,theta_dot_data,'Linewidth',1.5,'Color','red')
xlabel('t[s]');ylabel('弹道倾角 [°]');
title('弹道倾角随时间变化曲线')

figure(6)
plot(time,omegaz_data,'Linewidth',1.5,'Color','red')
xlabel('t[s]');ylabel('俯仰角速度 [rad/s]');
title('俯仰角速度随时间变化曲线')

