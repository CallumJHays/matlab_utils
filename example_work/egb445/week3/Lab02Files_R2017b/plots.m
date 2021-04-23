%% Plots

%% Positions and angle

figure(1)
subplot(3,1,1)
plot(tout,xref,'r',tout, x,'b')
title('Position x [m]','FontSize',18)
legend('reference','actual')
grid on
subplot(3,1,2)
plot(tout,yref,'r',tout, vx,'b')
title('Position y [m]','FontSize',18)
legend('reference','actual')
grid on
subplot(3,1,3)
plot(tout,rad2deg(thetaref),'r',tout,rad2deg(theta),'b')
title('Angle [degree]','FontSize',18)
legend('reference','actual')
grid on

%% Front and Rear Forces

figure(2)
subplot(2,1,1)
plot(tout,FF)
title('Front Force [N]','FontSize',18)
grid on
subplot(2,1,2)
plot(tout,FR)
title('Rear Force [N]','FontSize',18)
grid on

%% Translational and rotational velocities

figure(3)
subplot(3,1,1)
plot(tout,vx)
title('Velocity dx/dt [m/s]','FontSize',18)
grid on
subplot(3,1,2)
plot(tout,vy)
title('Velocity dy/dt [m/s]','FontSize',18)
grid on
subplot(3, 1, 3)
plot(tout,vtheta)
title('Angular velocity [rad/s]','FontSize',18)
grid on

%% xy-plane Position of the quadrotor

figure(4)
plot(x, y, 'r--') % TODO: , @@@,@@@)??
legend('reference','actual')
xlabel('x [m]','FontSize',18)
ylabel('y [m]','FontSize',18)
title('xy-plane Trajectory','FontSize',18)
grid on