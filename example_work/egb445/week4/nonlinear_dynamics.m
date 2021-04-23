function out1 = nonlinear_dynamics(F,in2)
%NONLINEAR_DYNAMICS
%    OUT1 = NONLINEAR_DYNAMICS(F,IN2)

%    This function was generated by the Symbolic Math Toolbox version 8.5.
%    22-Sep-2020 21:24:15

x2 = in2(2,:);
x3 = in2(3,:);
x4 = in2(4,:);
t2 = cos(x2);
t3 = sin(x2);
t4 = x4.^2;
t5 = t2.^2;
t6 = t5.*(3.0./2.0e+1);
t7 = t6-1.1e+1./2.0e+1;
t8 = 1.0./t7;
out1 = [x3;x4;-t8.*(F-t2.*t3.*1.4715+t3.*t4.*(3.0./1.0e+2));t8.*(t3.*(-5.3955)+F.*t2+t2.*t3.*t4.*(3.0./1.0e+2)).*5.0];