%% Assign Parameters
m = 0.15;
M_c = 0.4;
l = 0.2;
g = 9.81;


x_eq = [0 0 0 0]';


denominator = -m * cos(x_eq(2))^2 + M_c + m;

% 
d_x_3__x_2 = -g * m * (
    (cos(x_2)^2 - sin(x_2)^2) * (M_c + m * sin(x_2)^2) - 2 * m * sin(x_2)^2 + cos(x_2)^2)
d_x_4__x_2 = 

A = [
    0 0 1 0
    0 0 0 1
    0 d_x_3__x_2 0 0
    0 d_x_4__x_2 0 0
];

% F is input u
B = [
    0
    0
    1 / denominator
    1 / (l * denominator)
];


%% Simulate the Model
tStart=0;
tFinal=5;

out = sim('Cart_Pendulum_Linearised_a_n9464263', [tStart tFinal]);


%% Plot the States

plot(out)


%% Produce the Animation
Cart_Pendulum_Animation(out.tout, out.x1.Data, out.x2.Data, x_eq(1), x_eq(2))
