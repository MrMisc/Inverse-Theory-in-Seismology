rng('default')
rng(1)
N=11      %Number of z terms
no = 4    %Number of polynomial terms
z = 0:1/(N-1):1
z = z.'

r = randi([-100 100],no,1)
mtrue=r/100

G=ones(1,N)
upperpower=z
for i=2:no
    upperpower=upperpower*z.'
    upperpower = diag(upperpower)
    G(i,:) = upperpower
end

G=G.'
n=randn(N,1)*0.05   %0.05 is the standard deviation of the error vector decided by question


d=G*mtrue+n   %Synthetic observed d vector


mest=(G.'*G)^-1*G.'*d  %Simple least squares to solve m

dpre=G*mest    %Predicted data vector


i=[0:1:10]
plot(i, d, i, dpre)








zprime=[5]'
dprime=[0]'
%H=Gcubic(zprime)
h=dprime;


G1=ones(1,1)
upperpower=zprime
for i=2:no
    upperpower=upperpower*zprime.'
    upperpower = diag(upperpower)
    G1(i,:) = upperpower
end
H=G1.'


A=[G.'*G, H.';H, zeros(length(h))]
b=[G.'*d;h]

x=A\b

mest_SP=x(1:4)


subplot(2,2,1)
plot(z,d,'ro')
hold on
plot(z,G*mtrue,'r--')
plot(z,G*mest,'g-')
plot(z,G*mest_SP,'b-')
hold off
legend('Observed data','True model','Naive model','Constrained model')
title('Model passes through specific points')


i=[0:1:10]
plot(i, d, i, dpre)




H=[0 0 0 1]
h=[1]

A=[G.'*G, H.';H, zeros(length(h))]
b=[G.'*d;h]

x=A\b

mest_SP=x(1:4)




H=[1,-2,0,0;1,0,-4,0;1,0,0,-8]
h=[0,0,0].'

A=[G.'*G, H.';H, zeros(length(h))]
b=[G.'*d;h]

x=A\b

mest_SP=x(1:4)

subplot(2,2,3)
plot(z,d,'ro')
hold on
plot(z,G*mtrue,'r--')
plot(z,G*mest,'g-')
plot(z,G*mest_SP,'b-')
hold off
legend('Observed data','True model','Naive model','Constrained model')
title('Model params have specific relative sizes')



