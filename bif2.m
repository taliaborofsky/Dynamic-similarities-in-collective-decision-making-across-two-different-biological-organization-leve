%PLOTS END-STATE OF SIMULATION VARIABLES FOR VARIOUS CHOICES OF I
clearvars;
%figure;
alpha=.01; %-.2;  %sep of states in fp
rval = 3;  %incr seems to hit winner fp better, can increase degree of sep for moderate inputs, I too high both together
thval = 1;  %shifts fp along ~ diag leftward, does not reach active area
%w2_vec = 0:0.25:0.75;
w2 = 0; % no second wave
%if too small tend to both active, too big tend to no pop active
deltaI = .05;
fig1 = figure('pos', [10 10 1000 1000]);
echo off
%del = 0.3;
delvec = 0:0.2:0.6;
tau_vec = 1:3:10;
for(j=1:4)
    tau = tau_vec(j);
    for(k=1:4)
        %w2 = w2_vec(k);
        del = delvec(k);
        ax = subplot(4,4,(j-1)*4+k);
        I=.05;
        i=1;
        while(I<1.1)

            %fun=@(x)root2d(x,r,th,alpha,I)
            tspan = [0 500];
            x0 = [.2 .2];
            [t,x] = ode45(@(t,x)compfun(t,x,rval,thval,alpha,I,del,tau,w2),tspan,x0);
                %x wins with high tau

            xvec=x(:,1); % all the x-values
            yvec=x(:,2); % all the y-values
            xfinal(i) = xvec(end);
            yfinal(i) = yvec(end);
            Ivec(i) = I; % all the I values
            I = I+deltaI;
            i=i+1;
            
        end
        plot(ax,Ivec,xfinal, '-.r')
        hold on
        plot(ax,Ivec,yfinal, 'b');
        
        %[xfinal.', yfinal.'],'-mo', '-bs');
        if(k==1 || j==1)
        %title(['\tau = ', num2str(tau), ', and w_2 = ', num2str(w2)],'fontsize',14);
        title(['\tau = ', num2str(tau), ', and \delta = ', num2str(del)],'fontsize',14);

        end

        if(j==4) 
            xlabel('I values','fontsize',14)
        end
        if(k==1)
            ylabel('Final proportion','fontsize',14);
        end
        if(k==1&&j==1)
        legend({'x','y'},'Location','northwest','fontsize',14)
        end
        xlabel('I','fontsize',14)
        xlim([0,1])
        ylim([0,1])
    end
    %suplabel(['Final proportions in response to varying I values'],'t')
    %suplabel(['Final proportions in response to varying I values with \delta = ', num2str(del)],'t')
end


%hold on;
%plot(ax,Ivec,yfinal,'color','red');


%saveas(fig,'IvalsFinalPop.jpg')

