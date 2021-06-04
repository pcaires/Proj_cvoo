clear
exec('rootlocus.sce',-1)
exec('dinamica.sce',-1)
[wn,z] = damp(syslin('c',A,B,C,D))

A = A(1:4,1:4)
B = B(1:4,:)
s = poly(0,'s')

//LQR
P = syslin('c',A,B,eye(4,4))
Q = diag([1 .1 2 1])
R = diag([3000 3000])
k = lqr(P,Q,R)
spec(A-B*k)
