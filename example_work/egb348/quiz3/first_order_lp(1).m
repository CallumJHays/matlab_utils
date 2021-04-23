
%%% EGB348 Lecture 8
%%% Example 2(a)
K = 4;
C1 = 1;
R1 = 1/C1;
R3 = K*R1;
R2 = R3/(K-1);

%%% Example 2(b)
fp = 100;
C1A = 100e-9;
Kf = 2*pi*fp;
Km = C1/(Kf*C1A);
R1A = Km*R1;
R2A = Km*R2;
R3A = Km*R3;

K1 = (R2A+R3A)/R2A;
t1 = tf ([0 K1/(C1A*R1A)], [1 1/(C1A*R1A)]);

figure(1);
h = bodeplot(t1);
setoptions(h,'FreqUnits','Hz'); 
grid on;
