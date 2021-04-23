function eqn = current_voltage_gain(A_v, A_i, R_in, R_L)
    % returns an equation that relates the current and the voltage gain
    eqn = A_v == A_i / R_L * R_in;
end