G=[2 2 0 0;0 0 2 2;0 2 0 2]
[U,L,V]=svd(G)
r=rank(L)
Up=U(:,1:r)
Lp=L(1:r,1:r)
Vp=V(:,1:r)
d=[1.2 .87 .95]

covd=eye(3)*0.16

Ginv=Vp*inv(Lp)*Up.'
m=Ginv*d.'

covm=0.16*G.'*(G*G.')^-2*G

%4 observations
covd_b=eye(4)*0.16
G2=[2 2 0 0;0 0 2 2;0 2 0 2;0 2 0 2]
d2=[1.2 .87 .95 .88]
[U,L,V]=svd(G2)
r=rank(L)
Up=U(:,1:r)
Lp=L(1:r,1:r)
Vp=V(:,1:r)
Ginv2=Vp*inv(Lp)*Up.'
m2=Ginv2*d2.'
%covm2=0.16*G2.'*(G2*G2.')^-2*G2
covm2=0.16*(G2.'*G2)^-1

%Ginv*Ginv.'


%a priori information about velocities
%Important to take note that we need to invert the velocity values

mbar=[3 4 4 5]
mbar=mbar.^-1
mbar=mbar.'

covmbar=eye(4)*0.001

R=Ginv2*G2
mest_c=Ginv2*d2.'+(eye(4)-R)*mbar    %Equation 5.38


covm_c=Ginv2*covd_b*Ginv2.'+(eye(4)-R)*covmbar*(eye(4)-R).'  %Equation 5.41

%5 observations test

covd_c=eye(5)*0.16
G3=[2 2 0 0;0 0 2 2;0 2 0 2;0 2 0 2; 2 0 2 0]
d3=[1.2 .87 .95 .88 1.15]
[U,L,V]=svd(G3)
r=rank(L)
Up=U(:,1:r)
Lp=L(1:r,1:r)
Vp=V(:,1:r)
Ginv3=Vp*inv(Lp)*Up.'
m3=Ginv3*d3.'
covm3=0.16*G3.'*(G3*G3.')^-2*G3
covm3=0.16*(G3.'*G3)^-1


%a priori information about velocities + 5 data points


R=Ginv3*G3
mest_e=Ginv3*d3.'+(eye(4)-R)*mbar    %Equation 5.38


covm_e=Ginv3*covd_c*Ginv3.'+(eye(4)-R)*covmbar*(eye(4)-R).'  %Equation 5.41


