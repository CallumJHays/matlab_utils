%% Calculate control parameters from EPa

x_bar_a = [0 0 0 0]';
x_bar = x_bar_a;
[A, B, C, D, K, L] = nonlinear_dynamics(x_bar_a);

x0 = [0.2 20*pi/180 0 0]';

%% simulate both

step_size = '0.02';
solver = 'ode4';
t_final = 4;

l = sim('CP_ContrSys_Lin_a_n9464263', 'Solver', solver, 'TimeOut', t_final, 'FixedStep', step_size);
nl = sim('CP_ContrSys_NLin_a_n9464263', 'Solver', solver, 'TimeOut', t_final, 'FixedStep', step_size);

%% plot the results

plot_dynamics('Design Using Linearisation around EPa', ...
    l.tout, nl.F, nl.x, nl.x_hat, l.F, l.x, l.x_hat)

%% Show the cart animations_tilde

% Cart_Pendulum_Animation(nl.tout, ...
%     nl.x(:, 1), nl.x(:, 2), ...
%     x_bar_a(1), x_bar_a(2), ...
%     'CP_ContrSys_NLin_a_n9464263.avi')

% Cart_Pendulum_Animation(l.tout, ...
%     l.x(:, 1), l.x(:, 2), ...
%     x_bar_a(1), x_bar_a(2), ...
%     'CP_ContrSys_Lin_a_n9464263.avi')