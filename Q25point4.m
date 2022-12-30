rng('default')
rng(1)
% Set up z vector
N=50;z=[0:N-1].'/(N-1);
% Set up model
M=4
mtrue = [1, 1/2, 1/4, 1/8].'
% Set up data kernel
G = [ ones(N,1), z, z.*z, z.^3 ];
% Compute data with specified variance
sigmam =55.55
sigmad=(0.05^2+sigmam^2)^.5    %For question 3-5.5
%sigmad=0.1
dobs=G*mtrue+random('Normal',0,sigmad,N,1);




L = 3

r=1/sigmam
F = zeros(N+L,M)
f = zeros(N+L,1)
F(1:N,1:M)=1/sigmad*G
f(1:N)=1/sigmad*dobs
F(N+1,1)=1*r
F(N+1,2)=(-2)*r
F(N+2,1)=1*r
F(N+2,3)=(-4)*r
F(N+3,1)=1*r
F(N+3,4)=(-8)*r;




A=F.'*F
b=F.'*f
mest_ML=A\b




subplot(2,2,4)
plot(z,dobs,'ro')
hold on
plot(z,G*mtrue,'r--')
%plot(z,G*mest,'g-')
%plot(z,G*mest_SP,'b-')
plot(z,G*mest_ML,'c*')
hold off
legend('Observed data','True model','Maximum Likelihood Model')
title('Model params have specific relative sizes')
