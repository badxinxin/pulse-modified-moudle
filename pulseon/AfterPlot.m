%��simulink�����ȡ����
x_data = x.Data;
y_data = y.Data;
v_data = v.Data;
theta_data = theta.Data*180/pi;
alpha_data = alpha.Data*180/pi;
omegaz_data = omegaz.Data*180/pi;
theta_dot_data = theta_dot.data*180/pi;
time = x.Time;

%��ͼ
figure(1)
plot(x_data,y_data,'LineWidth',1.5,'Color','blue')
xlabel('X [m]');ylabel('Y [m]');
title('��������')

figure(2)
plot(time,v_data,'LineWidth',1.5,'Color','red')
xlabel('t [s]');ylabel('v [m/s]');
title('�ٶ���ʱ��仯����')

figure(3)
plot(time,alpha_data,'LineWidth',1.5,'Color','red')
xlabel('t [s]');ylabel('���� [��]');
title('������ʱ��仯����')

figure(4)
plot(time,theta_data,'Linewidth',1.5,'Color','red')
xlabel('t[s]');ylabel('������ [��]');
title('��������ʱ��仯����')

figure(5)
plot(time,theta_dot_data,'Linewidth',1.5,'Color','red')
xlabel('t[s]');ylabel('������� [��]');
title('���������ʱ��仯����')

figure(6)
plot(time,omegaz_data,'Linewidth',1.5,'Color','red')
xlabel('t[s]');ylabel('�������ٶ� [rad/s]');
title('�������ٶ���ʱ��仯����')

