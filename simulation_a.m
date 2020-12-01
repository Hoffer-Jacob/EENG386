% Jacob Hoffer

function simulation_a()

v_e = 4:0.1:6;
v_y = -12:0.1:-8;

[X,Y] = meshgrid(v_e, v_y);

F = 4 * 3.14 * 8.55e-12 .* X .* Y;

close all;

figure(); hold on; grid on;
surf(X,Y,F);
title('Electrostatic Force (N)');
xlabel('Electrode Voltage (V)');
ylabel('Yoke Voltage (V)');
colorbar;

end