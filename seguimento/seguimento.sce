exec('SAE/MIMO/LQR.sce',-1)

A1 = A-B*K

L = diag([-1/1.5 -1/1.5])

C1 = [1 0 0 0;
     0 0 0 1]

C_ = C1*A1 - L*C1
D_ = C1*B

x(1) = 0.7*(15*deg)   //bb max
x(2) = 5*deg          //p max
x(3) = 5*deg          //r max
x(4) = 0.7*(30*deg)   //phi max

u(1) = 0.002*18*deg   //da max
u(2) = 0.02*23*deg     //dr max

P = syslin('c',A1,B,C_,D_)

//LQR
Q = diag(1./(x.^2))
R = diag(1./(u.^2))

K2 = lqr(P,Q,R)

Pf = syslin('c',A1-B*K2,B,eye(4,4))
[wn,z] = damp(Pf)
disp(wn)
disp(z)
disp(K2)

time = [0:0.1:15]
Sl = ss2tf(Pf)(:,1)

Y = csim('impulse',time,Sl*deg)
plot(time,Y')
////x = [ bb; p; r; phi; psi]
legend('bb','p','r','phi')
xgrid(1)
