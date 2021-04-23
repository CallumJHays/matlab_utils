function [A, B, C, D, K, L] = nonlinear_dynamics(fixed_point)

addpath('../../utils/')
sympref('FloatingPointOutput', true); % display all symnums at 4 sigfigs

%% dynamics
syms F m M_c l g t x1

constants = [
    m == 0.15
    M_c == 0.4
    l == 0.2
    g == 9.81
];

[x, x_t] = symfun_of_t('x', [4, 1]);

dynamics = @(x) [
    x(3)
    x(4)
    (x(4)^2*l*m*sin(x(2)) - g*m*sin(x(2))*cos(x(2)) + F) / (-m * cos(x(2))^2 + M_c + m)
    (-l*m*sin(x(2))*cos(x(2)) * x(4)^2 + g*(M_c + m)*sin(x(2)) - cos(x(2))*F) / (l * (-m * cos(x(2))^2 + M_c + m))
];

% write the computational update to a matlab file. this will be called from
% simulink
[plant, x_dot] = solve2fn(diff(x_t), ...
    [constants; diff(x_t) == dynamics(x)], ...
    [x; F], ...
    'Vars', {x, F}, ...
    'File', 'nonlinear_dynamics_plant');

% give it a test call so we fail fast
x0 = [0 0 0 0]';
plant(x0, 0);

%% controller

x_bar = sym('x_bar_', [4, 1]);
x_dot_tilde = subs(x_dot, x, x_bar);

A_jac = jacobian(x_dot_tilde, F);
B_jac = jacobian(subs(x_dot_tilde, F, 1), x_bar);

B = double(subs(A_jac, x_bar, fixed_point));
A = double(subs(B_jac, x_bar, fixed_point));

% we are told this
C = [1 0 0 0
     0 1 0 0];
D = 0;

is_controllable = rank(ctrb(double(A), double(B))) == length(x)
is_observable = rank(obsv(double(A), C)) == length(x)

assert(is_controllable & is_observable)

K = place(A, B, [-3, -4, -5, -6]);
L = place(A', C', [-63, -64, -65, -66])';

%% observer

y = symfun_of_t('y', [min(size(C)), 1]);
[x_hat, x_hat_t] = symfun_of_t('x_hat_', [4, 1]);

x_tilde_hat = x_hat - x_bar;
y_tilde_hat = C * x_tilde_hat;
y_bar = C * x_bar;
y_tilde = y - y_bar;

nonlinear_observer = diff(x_hat_t) == ...
    dynamics(x_tilde_hat) + L * (y_tilde - y_tilde_hat);

solve2fn(diff(x_hat_t), ...
    [constants; nonlinear_observer; x_bar == fixed_point], ...
    [y; x_hat; F], ...
    'Vars', {y, x_hat, F}, ...
    'File', 'nonlinear_dynamics_observer');

end