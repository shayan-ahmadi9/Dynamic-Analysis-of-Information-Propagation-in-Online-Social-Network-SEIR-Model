function Xdot = model(t,X,beta,lambda,epsilon,gamma,delta)

    S = X(1);
    E = X(2);
    I = X(3);
    R = X(4);

    Sdot = beta - delta*S - lambda*I*S;
    Edot = lambda*I*S - (epsilon+delta)*E;
    Idot = epsilon*E - (gamma+delta)*I;
    Rdot = gamma*I - delta*R;

    Xdot=[Sdot, Edot, Idot, Rdot]';

end