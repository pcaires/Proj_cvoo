clear
exec('dinamica.sce',-1)

A = A(1:4,1:4)
B = B(1:4,:)
C = eye(4,4)


x(1) = 0.05*(15*deg)  //bb max
x(2) = 5*deg          //p max
x(3) = 5*deg          //r max
x(4) = 0.7*(30*deg)   //phi max

u(1) = 0.001*18*deg //da max
u(2) = 0.01*23*deg  //dr max


//LQR
P = syslin('c',A,B,C)
Q = diag(1./(x.^2))
R = diag(1./(u.^2))
k = lqr(P,Q,R)
[wn,z] = damp(syslin('c',A-B*k,B,eye(4,4)))
disp(wn)
disp(z)
