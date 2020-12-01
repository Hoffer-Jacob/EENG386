% Jacob Hoffer

function simulation_b(angle_incident, angle_mirror, width_mirror)
%SIMULATION_B visually show Snell's law
%   angle_incident: Angle of incidence
%   angle_mirror:   angle of the Mirror with repsect to the +x axis
%   width_mirror:   Width of the mirror in micrometers

close all;

angle_mirror = angle_mirror * pi /180;
normal_angle = angle_mirror + pi/2;
angle_incident = angle_incident * pi / 180;
angle_incoming = angle_incident + normal_angle;
angle_reflection = pi/2 - angle_incident  + angle_mirror;

n_glass = 2.5;
n_air = 1;

angle_transmission = asin(sin(angle_incident) * n_air / n_glass);
angle_outgoing = angle_transmission + pi/2 + angle_mirror;

delta = 0.0001;
x = -10:delta:10;

mirror = tan(angle_mirror) .* x;
mirror_bottom = tan(angle_mirror) .* x - width_mirror;
normal = 10*[cos(normal_angle), sin(normal_angle); 0, 0];

incoming = tan(angle_incoming) .* x;
reflection = tan(angle_reflection) .* x;

transmission = tan(angle_outgoing) .* x;

shift = width_mirror * (tan(angle_transmission) - tan(angle_incident));
x2 = x + shift;

disp(shift);

figure(); hold on; grid on;
axis([-4, 4, -10, 10]);
xlabel('x (um)');
ylabel('y (um)');
title("Snell's Law with varying incident plane orientation");
plot(x, mirror, 'b-');
plot(x, mirror_bottom, 'b-');
plot(normal(:,1), normal(:,2), 'b--');
plot(x(x < 0), incoming(x < 0), 'g-');
plot(x(x > 0), incoming(x > 0), 'g--');
plot(x(x > 0), reflection(x > 0), 'r-');
plot(x(and(transmission > mirror_bottom, transmission < mirror)),...
    transmission(and(transmission > mirror_bottom, transmission < mirror)), 'm-');
plot(x2(incoming < mirror_bottom), incoming(incoming < mirror_bottom), 'm-');
end

