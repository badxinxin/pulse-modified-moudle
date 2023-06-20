% 定义文件名和图例
files = {'0mm', 'origin', '200mm', '400mm','matlab'}; % 文件名
legends = {'Lp=0', 'Lp=150mm', 'Lp=200mm', 'Lp=400mm','No PulseForce'}; % 图例

% 初始化颜色
colors = {'blue', 'red', 'green', 'black','yellow'}; %曲线颜色

% 循环处理每个文件
for f = 1:length(files)

    % 加载数据
    load([files{f}, '.mat']);
    
    % 从simulink结果获取数据
    x_data = x.Data;
    y_data = y.Data;
    v_data = v.Data;
    theta_data = theta.Data*180/pi;
    alpha_data = alpha.Data;
    omegaz_data = omegaz.Data;
    theta_dot_data = theta_dot.Data*180/pi;
    time = x.Time;

    % 画图
    figure(1)
    plot(x_data, y_data, 'LineWidth', 1.5, 'Color', colors{f}); hold on;
    xlabel('X [m]'); ylabel('Y [m]');
    title('方案弹道');
    legend(legends);
    
    figure(2)
    plot(time, v_data, 'LineWidth', 1.5, 'Color', colors{f}); hold on;
    xlabel('t [s]'); ylabel('v [m/s]');
    title('速度随时间变化曲线');
    legend(legends);
    
    figure(3)
    plot(time, alpha_data, 'LineWidth', 1.5, 'Color', colors{f}); hold on;
    xlabel('t [s]'); ylabel('攻角 [°]');
    title('攻角随时间变化曲线');
    legend(legends);

    figure(4)
    plot(time, theta_data, 'LineWidth', 1.5, 'Color', colors{f}); hold on;
    xlabel('t [s]'); ylabel('俯仰角 [°]');
    title('俯仰角随时间变化曲线');
    legend(legends);
    
    figure(5)
    plot(time, theta_dot_data, 'LineWidth', 1.5, 'Color', colors{f}); hold on;
    xlabel('t [s]'); ylabel('弹道倾角 [°]');
    title('弹道倾角随时间变化曲线');
    legend(legends);
    
    figure(6)
    plot(time, omegaz_data, 'LineWidth', 1.5, 'Color', colors{f}); hold on;
    xlabel('t [s]'); ylabel('俯仰角速度 [rad/s]');
    title('俯仰角速度随时间变化曲线');
    legend(legends);


end

% 关闭 hold on
hold off;
