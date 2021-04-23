function eqn = incremental_resistance(n, v_t, i_dq, r_dq)
    % returns the incremental resistance equation, where
    % i_dq = quiescent diode current
    % r_dq = quiescent diode resistance
    % n = ideality factor (1 <= n <= 2)
    % v_t = thermal voltage at operating point
    eqn = i_dq * r_dq == n * v_t;
end