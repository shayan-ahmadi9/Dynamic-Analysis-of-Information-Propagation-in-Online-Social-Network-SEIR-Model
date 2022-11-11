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
epsilon = 0.5;
% the probability of the transmission node to 
% become an immune node
gamma = 0.25;
% frequency of new message receiving by an average user
lambda = 1;


%========================================================
%========================================================


% fixed rate for beta and delta and lambda
% epsilon and gamma are probability so they change between 0 to 1
for epsilon = 0.1:0.01:1
    for gamma = 0.1:0.01:1

        %========================================================
        % Uncomment this part to print the fixed points of the system 
        % based on given paramteres

        element1 =   ( (epsilon+delta)*(delta+gamma) ) / ( epsilon*lambda );
        element2 = - ( epsilon*(-beta*lambda+delta^2+delta*gamma) + delta^2*(delta+gamma) ) / ( epsilon*lambda*(epsilon+delta) );
        element3 = - ( epsilon*(-beta*lambda+delta^2+delta*gamma) + delta^2*(delta+gamma) ) / ( lambda*(epsilon+delta)*(delta+gamma) );
        element4 = - ( gamma*(epsilon*(-beta*lambda+delta^2+delta*gamma)+delta^2*(delta+gamma)) ) / ( delta*lambda*(epsilon+delta)*(delta+gamma) );

        fp1 = [1,0,0,0];
        fp2 = [element1, element2, element3, element4];

        S = 1;
        E = 0;
        I = 0;
        R = 0;

        %========================================================

        %jacobi for (1,0,0)
        J1 = [-delta-lambda*I, 0, -lambda*S ; lambda*I, -epsilon-delta, lambda*S ; 0, epsilon, -gamma-delta];

        S = element1;
        E = element2;
        I = element3;
        R = element4;

        %jacobi for 2nd fixed point
        J2 = [-delta-lambda*I, 0, -lambda*S ; lambda*I, -epsilon-delta, lambda*S ; 0, epsilon, -gamma-delta];

        eigenValues1 = real( eig(J1) );
        eigenValues2 = real( eig(J2) );
        
        % when none of the fixed points are sink
        figure(1)
        p1 = plot(gamma, epsilon,'.r');
        hold on
        grid on
 
        % when fixed point (1,0,0) is unstable and 
        %the other one is sink
        if all(eigenValues2 <= 0) && any(eigenValues1 > 0)
            
            figure(1)
            p2 = plot(gamma, epsilon, '.b');
            hold on
            
        end
        
        
    end
end

xlabel('\gamma','fontsize',20)
ylabel('\epsilon','fontsize',20)
title(['\beta = 0.2 & \delta = 0.2 & \lambda = ',num2str(lambda)])
legend([p1,p2],{'(1,0,0)','2nd FP'})



%========================================================
%========================================================



% fixed rate for beta and delta and gamma
% epsilon is probability so it can change between 0 to 1
% for epsilon = 0.1:0.01:1
%     for lambda = 0.5:0.01:1.5
% 
%         %========================================================
%         % Uncomment this part to print the fixed points of the system 
%         % based on given paramteres
% 
%         element1 =   ( (epsilon+delta)*(delta+gamma) ) / ( epsilon*lambda );
%         element2 = - ( epsilon*(-beta*lambda+delta^2+delta*gamma) + delta^2*(delta+gamma) ) / ( epsilon*lambda*(epsilon+delta) );
%         element3 = - ( epsilon*(-beta*lambda+delta^2+delta*gamma) + delta^2*(delta+gamma) ) / ( lambda*(epsilon+delta)*(delta+gamma) );
%         element4 = - ( gamma*(epsilon*(-beta*lambda+delta^2+delta*gamma)+delta^2*(delta+gamma)) ) / ( delta*lambda*(epsilon+delta)*(delta+gamma) );
% 
%         fp1 = [1,0,0,0];
%         fp2 = [element1, element2, element3, element4];
% 
%         S = 1;
%         E = 0;
%         I = 0;
%         R = 0;
% 
%         %========================================================
% 
%         %jacobi for (1,0,0)
%         J1 = [-delta-lambda*I, 0, -lambda*S ; lambda*I, -epsilon-delta, lambda*S ; 0, epsilon, -gamma-delta];
% 
%         S = element1;
%         E = element2;
%         I = element3;
%         R = element4;
% 
%         %jacobi for 2nd fixed point
%         J2 = [-delta-lambda*I, 0, -lambda*S ; lambda*I, -epsilon-delta, lambda*S ; 0, epsilon, -gamma-delta];
% 
%         eigenValues1 = real( eig(J1) );
%         eigenValues2 = real( eig(J2) );
%         
%         % when none of the fixed points are sink
%         figure(1)
%         p1 = plot(lambda, epsilon,'.r');
%         hold on
%         grid on
%         
%         % when fixed point (1,0,0) is unstable and 
%         %the other one is sink
%         if all(eigenValues2 <= 0) && any(eigenValues1 > 0)
%             
%             figure(1)
%             p2 = plot(lambda, epsilon, '.b');
%             hold on
%             
%         end
% 
%         
%     end
% end
% 
% xlabel('\lambda','fontsize',20)
% ylabel('\epsilon','fontsize',20)
% title(['\beta = 0.2 & \delta = 0.2 & \gamma = ',num2str(gamma)])
% legend([p1,p2],{'(1,0,0)','2nd FP'})


