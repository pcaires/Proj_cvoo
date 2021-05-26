clear
exec('dinamica.sce',-1)
[wn,z] = damp(syslin('c',A,B,C,D))



p1 = [wn(1) z(1)] // integrador
p2 = [wn(2) z(2)] // espiral estável (nível 1) 
p3 = [wn(3) z(3)] // RH
p4 = [wn(4) z(4)] // RH
p5 = [wn(5) z(5)] // rolamento

n1_RH = (p3(1)>0.5) && (p3(2)>0.08) && (p3(1)*p3(2)>0.15) //False nivel 2

n1_R = 1/p5(1)<1.4 //False nivel 2

//Globalmente nivel 2

s = poly(0,'s')
C = [0 0 1 0 0]

wn = [0.5 1/1.4]
zeta =[0.6 0.08]

// Yaw damper
H1 = syslin('c',A,B(:,1),C)
figure(0)
clf();
[Ki,s]=kpure(H1) // Gains that give pure imaginary closed loop poles
evans(H1,100);
title('Yay dampner')
sgrid(zeta,wn)
plot([real(s) real(s)],[imag(s) -imag(s)],'*r')
plot([-0.15 -0.15],[-1 1],'--k')
set(gca(),"grid",[1 1])



// ARI
s = poly(0,'s')
H2 = syslin('c',A,B(:,1),C)

figure(1)
clf();
[Ki,s]=kpure(H2) // Gains that give pure imaginary closed loop poles
evans(H2,100);
title('ARI')
sgrid(zeta,wn)
plot([real(s) real(s)],[imag(s) -imag(s)],'*r')
plot([-0.15 -0.15],[-2.6 2.6],'--k')
set(gca(),"grid",[1 1])


//LQR
P = syslin('c',A,B,C)
Q=diag([3282.2 67 820.7 3282.8 3282.8])
R=diag([3282.8 3282.8])
k=lqr(P,Q,R)

