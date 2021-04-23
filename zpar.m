function equiv = zpar(impedances)
    % calculates the equivalent impedance from parallel impedances
    equiv = prod(impedances) / sum(impedances);
end