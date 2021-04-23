%% Calculate control parameters from EPa

x_bar_b = [0 pi 0 0]';
x_bar = x_bar_b;
[A, B, C, D, K, L] = nonlinear_dynamics(x_bar_b);

x0 = [0.2 200*pi/180 0 0]';

%% simulate both

% step_size = '0.02'; 
solver = 'ode45';
t_final = 4;

l = sim('CP_ContrSys_Lin_a_n9464263', 'Solver', solver, 'TimeOut', t_final);%, 'FixedStep', step_size);
nl = sim('CP_ContrSys_NLin_a_n9464263', 'Solver', solver, 'TimeOut', t_final);%, 'FixedStep', step_size);

%% plot the results

% plot_dynamics('Design Using Linearisation around EPb', ...
%     l.tout, nl.F, nl.x, nl.x_hat, l.F, l.x, l.x_hat)

%% Show the cart animations_tilde

% Cart_Pendulum_Animation(nl.tout, ...
%     nl.x(:, 1), nl.x(:, 2), ...
%     x_bar_b(1), x_bar_b(2), ...
%     'CP_ContrSys_NLin_b_n9464263.avi')    

Cart_Pendulum_Animation(l.tout, ...
    l.x(:, 1), l.x(:, 2), ...
    x_bar_b(1), x_bar_b(2), ...
    'CP_ContrSys_Lin_b_n9464263.avi')