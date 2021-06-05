clear
exec('pole_placement.sce',-1)

A1 = A-B*K

L = diag([-1/1.5 -1/1.5])

C = [1 0 0 0;
     0 0 0 1]

C_ = C*A1 - L*C
D_ = C*B

x(1) = 0.7*(15*deg)   //bb max
x(2) = 10*deg          //p max
x(3) = 10*deg          //r max
x(4) = 0.7*(30*deg)   //phi max

u(1) = 0.002*18*deg   //da max
u(2) = 0.02*23*deg     //dr max

kd = 0.1

P = syslin('c',A1,B,C_,D_) * kd *%s // Adição de ganho derivativo para estabilizar a espiral

//LQR
Q = diag(1./(x.^2))
R = diag(1./(u.^2))

K = lqr(P,Q,R)

Pf = syslin('c',A1-B*K,B,eye(4,4)) * kd * %s
[wn,z] = damp(Pf)
disp(wn)
disp(z)

time = [0:0.1:60]
Sl = ss2tf(Pf)(:,1)

Y = csim('impulse',time,Sl)
plot(time,Y')
//x = [ bb; p; r; phi; psi]
legend('bb','p','r','phi','impulse')
xgrid(1)
