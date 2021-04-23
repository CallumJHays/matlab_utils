%% MainFile

%% Load model and controller parameters

quadrotorparam


%% Simulation

tStart=0;
tFinal=110;
outputsample=0.25;

sim('QuadrotorVertPlane_R2017b', [tStart tFinal]);

%% Visualization of results

plots

%% Animation

quadrotoranimation