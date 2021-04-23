function [x, x_t] = symfun_of_t(name, shape)
%SYMFUN_VEC Creates an array of time-dependant symfunctions.
syms t
x = sym(name, shape);

for idx = 1:numel(x)
    x(idx) = symfun(str2sym(sprintf('%s(t)', x(idx))), t);
end

x_t = symfun(x, t);

end