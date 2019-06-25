%creates bifurcation diagram with NO switch. Varies I and plots the FPs.
%Stable is denoted with filled dot unstable with star
echo off
clearvars;
figure;
alpha=.01; %-.2;  %sep of states in fp   %up to .35 isola
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
    fun=@(x)root2d(x,r,th,alpha,I,tau);
    soln = fsolve(fun,x0,opts); % Solves the equation fun = 0 for initial 
    % conditions x0 and optimized options
    
    J = jac( soln,r,th,alpha ,I,tau); % Why are there also parameters?
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
    fun=@(x)root2d(x,r,th,alpha,I,tau);
    soln = fsolve(fun,x0,opts);
    J = jac( soln,r,th,alpha ,I,tau); 
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
    fun=@(x)root2d(x,r,th,alpha,I,tau);
    soln = fsolve(fun,x0,opts);
    J = jac( soln,r,th,alpha ,I,tau); 
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
    fun=@(x)root2d(x,r,th,alpha,I,tau);
    soln = fsolve(fun,x0,opts);
    J = jac( soln,r,th,alpha ,I,tau); 
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
    fun=@(x)root2d(x,r,th,alpha,I,tau);
    soln = fsolve(fun,x0,opts);
    J = jac( soln,r,th,alpha ,I,tau); 
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
    fun=@(x)root2d(x,r,th,alpha,I,tau);
    soln = fsolve(fun,x0,opts);
    J = jac( soln,r,th,alpha ,I,tau); 
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
%title('Direct Switching of Strength 0.5 for pop 2, 0.15 for pop1')
%THIS PIECE PLOTS THE Y BIFURCATION DIAGRAM
% figure;
% plot(Ivec,yvec,'.');
% hold on
% plot(Ivecun,yvecun,'*');
% ylim([0 1])