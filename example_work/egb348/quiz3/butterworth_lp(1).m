
%%% EGB348 Lecture 8
%%% Example 3(a)
Amax = 3;
Amin = 20;
wp = 1;
ws = 4;

epsilon = sqrt(10^(0.1*Amax) - 1);
n = log10((10^(Amin*0.1) - 1) / (10^(0.1*Amax) - 1)) / (2*log10(ws/wp));

n = ceil(n);

%B = epsilon^(1/n);
%t1 = tf([0 0 1/(B*B)],[1 sqrt(2)/B 1/(B*B)]);

t1 = tf([0 0 1],[1 sqrt(2) 1]);

figure(1);
bodeplot(t1);
grid on;

%%% Example 3(b)
C1 = 1;
C2 = C1;
K = 10;

a = 1;
b = -sqrt(2);
c = 2-K;

R2 = (-1*b + sqrt(b*b-4*a*c))/(2*a);
R1 = 1/R2;
R4 = K*(R1+R2);
R3 = R4/(K-1);

%%% Example 3(c)
fp = 2e3;
Kf = 2*pi*fp;
C1A = 5e-9;
C2A = C1A;
Km = C1/(Kf*C1A);
R1A = Km*R1;
R2A = Km*R2;
R3A = Km*R3;
R4A = Km*R4;

K1 = 1 + R4A/R3A;
num = K1/(R1A*R2A*C1A*C2A);
den1 = 1/(R1A*C2A) + 1/(R2A*C2A) + (1-K1)/(R2A*C1A);
den2 = 1/(R1A*R2A*C1A*C2A);

t1 = tf([0 0 num],[1 den1 den2]);
figure(1);
h = bodeplot(t1);
setoptions(h,'FreqUnits','Hz'); 
grid on;


