function eqn = diode_characteristic(n, v_t, v_d, i_d, i_s)
    % returns the diode characteristic equation
    % n = ideality factor
    % v_t = thermal voltage at the operating temperature
    % i_s = diode saturation current
    % i_d = diode current at quiescent point
    % v_d = the voltage drop across the entire diode at quiescent point
    eqn = i_d == i_s * (exp(v_d / (n * v_t)) - 1);
end