
%%% EGB348 Lecture 8
%%% Example 4
Amax = 0.5;
Amin = 20;
wp = 200;
ws = 600;

epsilon = sqrt(10^(0.1*Amax) - 1);
n = acosh(sqrt((10^(Amin*0.1) - 1) / (10^(0.1*Amax) - 1))) / acosh((ws/wp));
n = ceil(n);

t1 = tf([0 0.71570],[1 0.62646]);
t2 = tf([0 0 1],[1 0.62646 1.14245]);

figure(1);
bodeplot(t1*t2);
grid on;
