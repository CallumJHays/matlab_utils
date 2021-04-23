function divided = vdiv(v, z1, z2)
    % performs voltage division, from the voltage source - after z1 but
    % before z2
    divided = v * z2 / (z1 + z2);
end