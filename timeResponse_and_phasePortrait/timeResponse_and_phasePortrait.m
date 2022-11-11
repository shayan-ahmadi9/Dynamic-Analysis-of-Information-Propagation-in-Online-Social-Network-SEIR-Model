clear
close all
clc

% <<<<<<<<<<<<<<<<<<<< Parameters >>>>>>>>>>>>>>>>>>>>

% Activation Rate
beta = 0.2;
% Diactivation Rate
delta = 0.2;
% probability of the latent node to become the 
% transmission node
epsilon = 0.8;
% the probability of the transmission node to 
% become an immune node
gamma = 0.1;
% frequency of new message receiving by an average user
lambda = 1;

%========================================================

% Uncomment this part to print the fixed points of the system 
% based on given paramteres

% element1 =   ( (epsilon+delta)*(delta+gamma) ) / ( epsilon*lambda );
% element2 = - ( epsilon*(-beta*lambda+delta^2+delta*gamma) + delta^2*(delta+gamma) ) / ( epsilon*lambda*(epsilon+delta) );
% element3 = - ( epsilon*(-beta*lambda+delta^2+delta*gamma) + delta^2*(delta+gamma) ) / ( lambda*(epsilon+delta)*(delta+gamma) );
% element4 = - ( gamma*(epsilon*(-beta*lambda+delta^2+delta*gamma)+delta^2*(delta+gamma)) ) / ( delta*lambda*(epsilon+delta)*(delta+gamma) );
% 
% fp1 = [1,0,0,0]
% fp2 = [element1, element2, element3, element4]

%========================================================

% <<<<<<<<<<<<<<<<<<<< Initial Values >>>>>>>>>>>>>>>>>>>>

I0 = 0.1;
S0 = 1-I0;
E0 = 0;
R0 = 0;

%========================================================

% time span
tSpan = [0 100];

options=odeset('RelTol',1e-3,'AbsTol',1e-3,'maxstep',1e-2);

[T,X]=ode45(@(t,x) model(t,x,beta,lambda,epsilon,gamma,delta),tSpan,[S0,E0,I0,R0],options);

% not yet received any news about the rumor, up to time t
S = X(:,1);
% have received the rumor already but not getting 
% immediate notice but still may notice
E = X(:,2);
% receive, read and believe in the rumor, so that they
% forward the rumor message
I = X(:,3);
% had contacted with the rumor some time but may not be
% influenced by the rumor any later
R = X(:,4);

%% <<Uncomment this section to plot time response by:>>

figure(1)
plot(T,S,'linewidth',2);
grid on
hold on
plot(T,E,'linewidth',2);
plot(T,I,'linewidth',2);
plot(T,R,'linewidth',2);

xlabel('time','fontsize',15)
ylabel('S(t),E(t),I(t),R(t)','fontsize',15)
legend('S(t)','E(t)','I(t)','R(t)','fontsize',12);

%% plotting phase portrait for different parameter values

%% <<Uncomment this section to plot phase portrait by:>>
% Changin lambda

% for  lambda = 1 
%     
%     [T,X]=ode45(@(t,x) model(t,x,beta,lambda,epsilon,gamma,delta),tSpan,[S0,E0,I0,R0],options);
% 
%     S = X(:,1);
%     E = X(:,2);
%     I = X(:,3);
% 
%     figure(2)
%     plot3(S,E,I,'linewidth',2,'DisplayName',['\lambda = ',num2str(lambda)]);
%     hold on 
%     plot3(S0,E0,I0,'ro')
%     
%     xlabel('S')
%     ylabel('E')
%     zlabel('I')
%     legend
%     
% end

%% <<Uncomment this section to plot phase portrait by:>>
% Changing gamma 

% for  gamma = 0.01:0.05:0.2 
%     
%     [T,X]=ode45(@(t,x) model(t,x,beta,lambda,epsilon,gamma,delta),tSpan,[S0,E0,I0,R0],options);
% 
%     S = X(:,1);
%     E = X(:,2);
%     I = X(:,3);
% 
%     figure(2)
%     plot3(S,E,I,'linewidth',2,'DisplayName',['\gamma = ',num2str(gamma)]);
%     hold on 
%     plot3(S0,E0,I0,'ro')
%     
%     xlabel('S')
%     ylabel('E')
%     zlabel('I')
%     legend
%     
% end

%% <<Uncomment this section to plot phase portrait by:>>
% changing lambda and epsilon

% i = 2;
% for lambda = 0.1:0.2:0.7
%     for  epsilon = 0.1:0.2:0.7 
% 
%         [T,X]=ode45(@(t,x) model(t,x,beta,lambda,epsilon,gamma,delta),tSpan,[S0,E0,I0,R0],options);
% 
%         S = X(:,1);
%         E = X(:,2);
%         I = X(:,3);
% 
%         figure(i)
%         plot3(S,E,I,'linewidth',2,'DisplayName',['\epsilon = ',num2str(epsilon)]);
%         hold on 
%         plot3(S0,E0,I0,'ro')
% 
%         xlabel('S')
%         ylabel('E')
%         zlabel('I')
%         legend
%         title(['\lambda = ',num2str(lambda)])
% 
%     end
%     i = i+1;
% end

%% <<Uncomment this section to plot phase portrait by:>>
% changing lambda and gamma

% i = 2;
% for lambda = 0.1:0.2:0.7
%     for  gamma = 0.01:0.05:0.2 
% 
%         [T,X]=ode45(@(t,x) model(t,x,beta,lambda,epsilon,gamma,delta),tSpan,[S0,E0,I0,R0],options);
% 
%         S = X(:,1);
%         E = X(:,2);
%         I = X(:,3);
% 
%         figure(i)
%         plot3(S,E,I,'linewidth',2,'DisplayName',['\gamma = ',num2str(gamma)]);
%         hold on 
%         plot3(S0,E0,I0,'ro')
% 
%         xlabel('S')
%         ylabel('E')
%         zlabel('I')
%         legend
%         title(['\lambda = ',num2str(lambda)])
% 
%     end
%     i = i+1;
% end

%% <<Uncomment this section to plot phase portrait by:>>
% changing gamma and epsilon

% i = 2;
% for gamma = 0.01:0.05:0.2 
%     for  epsilon = 0.1:0.2:0.7 
% 
%         [T,X]=ode45(@(t,x) model(t,x,beta,lambda,epsilon,gamma,delta),tSpan,[S0,E0,I0,R0],options);
% 
%         S = X(:,1);
%         E = X(:,2);
%         I = X(:,3);
% 
%         figure(i)
%         plot3(S,E,I,'linewidth',2,'DisplayName',['\epsilon = ',num2str(epsilon)]);
%         hold on 
%         plot3(S0,E0,I0,'ro')
% 
%         xlabel('S')
%         ylabel('E')
%         zlabel('I')
%         legend
%         title(['\gamma = ',num2str(gamma)])
% 
%     end
%     i = i+1;
% end
