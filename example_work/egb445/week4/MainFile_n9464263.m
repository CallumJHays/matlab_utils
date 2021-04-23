%% Assign Parameters
m = 0.15;
M_c = 0.4;
l = 0.2;
g = 9.81;


%% Simulate the Model
tStart=0;
tFinal=5;

out = sim('Cart_Pendulum_n9464263', [tStart tFinal]);


%% Plot the States

plot(out)

Cart_Pendulum_Animation(out.tout, out.x1.Data, out.x2.Data, x_eq(1), x_eq(2))

%% Produce the Animation
Cart_Pendulum_Animation(out.tout, out.x1.Data, out.x2.Data, x_eq(1), x_eq(2))
