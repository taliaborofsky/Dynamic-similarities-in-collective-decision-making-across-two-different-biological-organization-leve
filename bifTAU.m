% Examining the effects of decay (tau) on dynamics

%PLOTS variable dynamics with time for different deltas

clearvars;
% parameters
alpha=.01; r=3.2;  th=1;  I = 0.8;
del = 0.4;     x0 = [.2 .2];
tauVec = 0.5:0.1:1.5; % length 11
fig1 = figure('pos', [10 10 1000 1000]);
echo off
tspan = [0 120];

for j = 1:10
    tau = tauVec(j);
    
    ax = subplot(2,5,j);
    %[t, x] = ode45(@(t,x) compfun(t,x,r,th,alpha,I,del),tspan,x0); % compfun is the ODE system
    %[t, x] = ode45(@(t,x) compfundel(t,x,r,th,alpha,I,del,tau),tspan,x0); % compfun is the ODE system
    %[t, x] = ode45(@(t,x) compfundelWAVE(t,x,r,th,alpha,I,del,tau),tspan,x0); % compfun is the ODE system
    [t, x] = ode45(@(t,x) compfunEVENMIX(t,x,r,th,alpha,I,del,tau),tspan,x0); % compfun is the ODE system




    plot(ax,t,x(:,1), '-.r')
    hold on
    plot(ax,t,x(:,2), 'b');
    xlabel('Time (min)');
    ylabel('Proportion of Waggle Dancers');
    ylim([0,1])
    title(['\tau = ', num2str(tau)])
    if(j==1)
        legend('x','y')
    end
end
suplabel(['Waggle dance dynamics for varying \tau and initial conditions '...
    'x_0 = ', num2str(x0(1)), ', and y_0 = ', num2str(x0(2)), ', with r = ',...
    num2str(r), ', \theta = ', num2str(th), ', \alpha = ',...
    num2str(alpha), ' and \delta = ', num2str(del), ', with even mixing'],'t');
