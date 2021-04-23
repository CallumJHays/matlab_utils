function plot_dynamics(title_, t, F, x, x_hat, F_lin, x_lin, x_hat_lin)

figure;
title(title_);

xsize = size(x);
n_states = xsize(2);

% convert from radians to degrees
rad_vals = logical([0 1 0 1]);
x(:, rad_vals) = rad2deg(x(:, rad_vals));
x_hat(:, rad_vals) = rad2deg(x_hat(:, rad_vals));
x_lin(:, rad_vals) = rad2deg(x_lin(:, rad_vals));
x_hat_lin(:, rad_vals) = rad2deg(x_hat_lin(:, rad_vals));

n_plots = n_states + 1;

state_names = {'Cart position [m]', 'Pendulum angle [deg]', 'Cart velocity [m/s]', 'Pendulum rate [deg/s]'};

for idx = 1:n_states
    subplot(n_plots, 1, idx); hold on;
    
    plot(t, x(:, idx), 'b')
    plot(t, x_hat(:, idx), 'g')
    plot(t, x_lin(:, idx), 'r--')
    plot(t, x_hat_lin(:, idx), 'k--')
    
    x_str = "x_" + num2str(idx);
    legend(x_str + " Nonlinear", x_str + "hat Nonlinear", x_str + " Linear", x_str + "hat Linear")
    ylabel(state_names{idx})
    xlabel('Time [s]')
end

subplot(n_plots, 1, n_plots); hold on;

plot(t, F(:), 'b')
plot(t, F_lin(:), 'r--')

legend('F Nonlinear', 'F Linear')

ylabel('Control Force [N]')
xlabel('Time [s]')

hold off;

end