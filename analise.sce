clear
exec('rootlocus.sce',-1)
exec('dinamica.sce',-1)
[wn,z] = damp(syslin('c',A,B,C,D))

//Globalmente nivel 2

s = poly(0,'s')

wn = [0.5 1/1.4]
zeta =[0.6 0.08]

// Yaw damper
H1 = syslin('c',A,B(:,2),[0 0 1 0 0])
figure(0)
rootlocus(H1,[[1:10:200][200:50:1200][1200:10:1600][1600:100:5000]])
//evans(H1,1600)
//clf(0);
//[Ki,s]=kpure(H1) // Gains that give pure imaginary closed loop poles
//evans(150*H1,1);
//title('Yaw dampner')
//sgrid(zeta,wn)
//plot([real(s) real(s)],[imag(s) -imag(s)],'*r')
//plot([-0.15 -0.15],[-1 1],'--k')
//set(gca(),"grid",[1 1])
// Post-tuning graphical elements
//ch = gca().children;
//curves = ch(2).children;
//curves.thickness = 2;
//asymptotes = ch(ch.type=="Segs");
//asymptotes.segs_color = color("grey70");
//mtlb_axis([-1.2 0.1 -3 3])



// p/da
//H2 = syslin('c',A,B(:,1),[0 1 0 0 0])
//figure(1)
//rootlocus(H2,[1:100])
//clf(1);
//[Ki,s]=kpure(H1) // Gains that give pure imaginary closed loop poles
//evans(H1,1);
//title('p/da')
//sgrid(zeta,wn)
//plot([real(s) real(s)],[imag(s) -imag(s)],'*r')
//plot([-0.15 -0.15],[-1 1],'--k')
//set(gca(),"grid",[1 1])
// Post-tuning graphical elements
//ch = gca().children;
//curves = ch(2).children;
//curves.thickness = 2;
//asymptotes = ch(ch.type=="Segs");
//asymptotes.segs_color = color("grey70");
//mtlb_axis([-1.2 0.1 -3 3])




// ARI
s = poly(0,'s')
H3 = syslin('c',A,B(:,1),[0 0 1 0 0])

figure(2)
clf(2);
evans(H3,100)
[Ki,s]=kpure(H2) // Gains that give pure imaginary closed loop poles
title('ARI')
sgrid(zeta,wn)
plot([real(s) real(s)],[imag(s) -imag(s)],'*r')
plot([-0.15 -0.15],[-2.6 2.6],'--k')
set(gca(),"grid",[1 1])

// Post-tuning graphical elements
ch = gca().children;
curves = ch(2).children;
curves.thickness = 2;
asymptotes = ch(ch.type=="Segs");
asymptotes.segs_color = color("grey70");
mtlb_axis([-1.2 0.1 -5 5])


//LQR
P = syslin('c',A,B,eye(5,5))
Q=diag([3282.2 67 820.7 3282.8 3282.8])
R=diag([3282.8 3282.8])
k=lqr(P,Q,R)
spec(A-B*k)
