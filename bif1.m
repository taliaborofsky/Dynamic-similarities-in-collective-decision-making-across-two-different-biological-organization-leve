function[] = bif1(tau,del,cross,cross_after,whichFUN)
%PLOTS variable dynamics with time for different deltas
% If whichFUN = 1, then only stop signaling changes before and after switch
% otherwise, the intensity of cross-dancing also changes after the switch
% Output: two figures: one for the dynamics, the other for the change in
% the main parameter over time


% parameters
alpha=.01; r=3;  th=1;  I = 0.8; w2 = 0; 
echo off
tf = 120;
tspan = [0 tf];
x0 = [.2 .2];
fig1 = figure;
fig2 = figure; 
height = fig1.Position(4);
h2 = height*(5/8);
fig2.Position(4) = h2;
if (whichFUN == 1)
    figure(fig2)
    [t,x] = ode45(@(t,x)compfun(t,x,r,th,alpha,I,del,tau,w2),tspan,x0);
    del_graph = del*(heaviside(t-60) - heaviside(t-70))+ del*w2*(heaviside(t-90)- heaviside(t-100));
    plot(t,del_graph)
    ylim([-0.05,1])
    xlabel('Time (min)','fontsize',14, 'Fontname', 'Calibri');
    ylabel('Stop Signal Intensity','fontsize',14,'fontname','calibri')
    ax = gca;
    ax.YTick = 0:0.5:1;
    ax.Box = 'off';
    set(ax,'FontSize',20,'FontName','times');
    set(findall(ax,'Type','Line'),'LineWidth',2,'markersize',10)
else
    [t,x] = ode45(@(t,x)compfun_Wswitch(t,x,r,th,alpha,I,del,tau,cross,cross_after),tspan,x0);
    fig2 = figure;
    cross_graph_x = cross + cross_after*cross*heaviside(t-60);
    plot(t,cross_graph_x,'LineWidth',2)
    ylim([0,1])
    xlabel('Time (min)','fontsize',14, 'Fontname', 'Calibri');
    ylabel('Strength of Cross-Recruitment','fontsize',14,'fontname','calibri');

end
figure(fig1)
plot(t,x(:,1), '-.r')
hold on
plot(t,x(:,2), 'b');
xlabel('Time (min)','fontsize',14, 'Fontname', 'Calibri');
ylabel('Waggle Dance Activity','fontsize',14,'fontname','calibri');
ylim([0,1])
xlim([0,tf])
%title(['\tau = ', num2str(tau), ' and \delta = ', num2str(del)],'fontsize',14,'fontname','calibri')
legend({'x','y'},'location','east','fontsize',14,'fontname','calibri')
ax = gca;
%set(ax, 'FontSize',24,'FontName','times')
ax.Box = 'off';
set(ax,'FontSize',20,'FontName','times');
set(findall(ax,'Type','Line'),'LineWidth',2,'markersize',10)



%   for i = 1:2
%     %w2 = w2_vec(i);
%     tau = tau_vec(i);
%     for j = 1:3
%         del = delVec(j);
% 
%         ax = subplot(2,3,(i-1)*3+j);
%         %[t,x] =
%         %ode45(@(t,x)compfunEVENMIX(t,x,r,th,alpha,I,del,tau),tspan,x0);
%         [t,x] = ode45(@(t,x)compfun_Wswitch(t,x,r,th,alpha,I,del,tau),tspan,x0);
% 
%         %[t,x] =
%         %ode45(@(t,x)compfun(t,x,r,th,alpha,I,del,tau,w2),tspan,x0);
%             % find that second wave allows system to react appropriately
%             % with less stop signaling as long as slowed down enough by tau
% 
% 
%         plot(ax,t,x(:,1), '-.r')
%         hold on
%         plot(ax,t,x(:,2), 'b');
%         if (i == 2)
%             xlabel('Time (min)','fontsize',14, 'Fontname', 'Calibri');
%         end
%         if(j == 1)
%             ylabel('Proportion of Waggle Dancers','fontsize',14,'fontname','calibri');
%         end
%         ylim([0,1])
%         xlim([0,tf])
%         title(['\tau = ', num2str(tau), ' and \delta = ', num2str(del)],'fontsize',14,'fontname','calibri')
%         if(j==1)
%             if(i==1)
%                 legend({'x','y'},'location','east')
%             end
%         end
%         set(findall(ax,'Type','Line'),'LineWidth',2,'markersize',20);
%         set(ax,'FontSize',24,'FontName','times')
% 
%     end
% end
% figname = 'Figures/PopSize_OneStop/PopSizes';
% saveas(fig1, figname, 'epsc')
% 
% 
% %saveas(fig,'IvalsFinalPop.jpg')

end 