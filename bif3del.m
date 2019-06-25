%creates bifurcation diagram with NO switch. Varies I and plots the FPs.
%Stable is denoted with filled dot unstable with star
echo off
clearvars;
fig = figure;
%fig = figure('pos', [10 10 1800 1000]);
alpha= 0.01;%0.01; %-.2;  %sep of states in fp   %up to .35 isola
r=3;  %incr seems to hit winner fp better
th=1;  %shifts fp along ~ diag leftward, does not reach active area
%if too small tend to both active, too big tend to no pop active
i=1;
k=1;
I=.05;
Ivecun=[];
xvecun=[];
yvecun=[];
tau = 1;
del = 0.4;

%%%% ASK ABOUT WHAT OPTIMSET IS!!!???????????? %%%%

opts = optimset('Diagnostics','off', 'Display','off'); %creates an options
% structure opts where all fields are set to [] except Diagnostics and Display
% are off

while(I <2.1)
%     alpha=.1; %-.2;  %sep of states in fp
%     r=3;  %incr seems to hit winner fp better
%     th=.5;  %shifts fp along ~ diag leftward, does not reach active area
%     %if too small tend to both active, too big tend to no pop active
%     dx = -x+ SigmoidalGain(x-y+(1+alpha)*I,r,th);
%     dy=-y +SigmoidalGain(y-x+(1-alpha)*I,r,th);
%     quiver(x,y,dx,dy)
%     figure;
%     I = I+.1;
% end
    x0=[.2, .2];
    %@(x)parameterfun(x,a,b,c)
    fun=@(x)root2del(x,r,th,alpha,I,tau,del,w2);
    soln = fsolve(fun,x0,opts); % Solves the equation fun = 0 for initial 
    % conditions x0 and optimized options
    
    J = jacdel( soln,r,th,alpha,I,tau,del,w2); % Why are there also parameters?
    eigs = real(eig(J));
    len  = size(eigs);
    leng = len(1);
    pos = 0;
    for j=1:leng
        if(eigs(j) >= 0)
            pos = 1;
        end
    end

    if(pos==1)
        xvecun(k) = soln(1);
        yvecun(k) = soln(2);
        Ivecun(k) = I;
        k=k+1;
    else
        Ivec(i) = I;
        xvec(i) = soln(1);
        yvec(i) = soln(2);
        i=i+1;
    end
        
    
    x0=[.75, .2];
    %@(x)parameterfun(x,a,b,c)
    fun=@(x)root2del(x,r,th,alpha,I,tau,del,w2);
    soln = fsolve(fun,x0,opts);
    J = jacdel( soln,r,th,alpha ,I,tau,del,w2); 
    eigs = real(eig(J));
    len  = size(eigs);
    leng = len(1);
    pos = 0;
    for j=1:leng
        if(eigs(j) >= 0)
            pos = 1;
        end
    end
    if(pos==1)
        xvecun(k) = soln(1);
        yvecun(k) = soln(2);
        Ivecun(k) = I;
        k=k+1;
    else
        Ivec(i) = I;
        xvec(i) = soln(1);
        yvec(i) = soln(2);
        i=i+1;
    end
    
    
    

    
    x0=[.2, .75];
    %@(x)parameterfun(x,a,b,c)
    fun=@(x)root2del(x,r,th,alpha,I,tau,del,w2);
    soln = fsolve(fun,x0,opts);
    J = jacdel( soln,r,th,alpha ,I,tau,del,w2); 
    eigs = real(eig(J));
    len  = size(eigs);
    leng = len(1);
    pos = 0;
    for j=1:leng
        if(eigs(j) >= 0)
            pos = 1;
        end
    end
    if(pos==1)
        xvecun(k) = soln(1);
        yvecun(k) = soln(2);
        Ivecun(k) = I;
        k=k+1;
    else
        Ivec(i) = I;
        xvec(i) = soln(1);
        yvec(i) = soln(2);
        i=i+1;
    end
    
    
    x0=[.95, .05];
    %@(x)parameterfun(x,a,b,c)
    fun=@(x)root2del(x,r,th,alpha,I,tau,del,w2);
    soln = fsolve(fun,x0,opts);
    J = jacdel( soln,r,th,alpha ,I,tau,del,w2); 
    eigs = real(eig(J));
    len  = size(eigs);
    leng = len(1);
    pos = 0;
    for j=1:leng
        if(eigs(j) >= 0)
            pos = 1;
        end
    end
    if(pos==1)
        xvecun(k) = soln(1);
        yvecun(k) = soln(2);
        Ivecun(k) = I;
        k=k+1;
    else
        Ivec(i) = I;
        xvec(i) = soln(1);
        yvec(i) = soln(2);
        i=i+1;
    end
    
    
    x0=[.05, .95];
    %@(x)parameterfun(x,a,b,c)
    fun=@(x)root2del(x,r,th,alpha,I,tau,del,w2);
    soln = fsolve(fun,x0,opts);
    J = jacdel( soln,r,th,alpha ,I,tau,del,w2); 
    eigs = real(eig(J));
    len  = size(eigs);
    leng = len(1);
    pos = 0;
    for j=1:leng
        if(eigs(j) >= 0)
            pos = 1;
        end
    end
    if(pos==1)
        xvecun(k) = soln(1);
        yvecun(k) = soln(2);
        Ivecun(k) = I;
        k=k+1;
    else
        Ivec(i) = I;
        xvec(i) = soln(1);
        yvec(i) = soln(2);
        i=i+1;
    end
    
    
     x0=[.98, .98];
    %@(x)parameterfun(x,a,b,c)
    fun=@(x)root2del(x,r,th,alpha,I,tau,del,w2);
    soln = fsolve(fun,x0,opts);
    J = jacdel(soln,r,th,alpha ,I,tau,del,w2); 
    eigs = real(eig(J));
    len  = size(eigs);
    leng = len(1);
    pos = 0;
    for j=1:leng
        if(eigs(j) >= 0)
            pos = 1;
        end
    end
    if(pos==1)
        xvecun(k) = soln(1);
        yvecun(k) = soln(2);
        Ivecun(k) = I;
        k=k+1;
    else
        Ivec(i) = I;
        xvec(i) = soln(1);
        yvec(i) = soln(2);
        i=i+1;
    end
    
    I=I+.025;
    echo off
end

%THIS PIECE PLOTS THE X BIFURCATION DIAGRAM
plot(Ivec,xvec,'.');
if(~isempty(Ivecun))
    hold on
    plot(Ivecun,xvecun,'*');
end
ylim([0 1])
xlim([0 2.1])
xlabel('I');
ylabel('Fixed Points of x');
legend('stable', 'unstable', 'Location', 'northwest');
ax = gca;
ax.Box = 'off';
set(ax,'FontSize',20,'FontName','times');
set(findall(ax,'Type','Line'),'LineWidth',2,'markersize',10)
%set(findall(ax,'Type','font'),'fontsize',14,'fontname','calibri');

%The following code block works if you want it in a photoshop format
% axes = gca;
% legend({'stable', 'unstable'}, 'Location', 'northwest');
% xlims = {[0 2.1]};
% ylims = {[0,1]};
% yl = {'Fixed Points of x'};
% xl = {'I'};
% Photoshop_Format(fig,axes,'bifDiagramPSTry', xlims,ylims,xl,yl)



% ylim([0 1])
% xlim([0 2.1])
% xlabel('I');
% ylabel('Fixed Points of x');
% 
% 
% set(findall(gca,'Type','Line'),'LineWidth',2,'markersize',20);
% 
% set(gca,'FontSize',24,'FontName','times')
% box off
%THIS PIECE PLOTS THE Y BIFURCATION DIAGRAM
% figure;
% plot(Ivec,yvec,'.');
% hold on
% plot(Ivecun,yvecun,'*');
% ylim([0 1])