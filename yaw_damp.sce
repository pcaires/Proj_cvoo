clear
exec('dinamica.sce',-1)
A = A(1:4,1:4)
B = B(1:4,:)

// Yaw damper
H1 = syslin('c',A,B(:,2),[0 0 1 0 ])
S = zpk(H1)


// Produz root locus identico na forma ao do yaw damper (não pode ser representado por limitaçãpo do Scilab)
// Funciona substituindo o zero em aprox. 1500 por um em 100 
H_eq = zpk2tf(zpk( [S.Z{1}(2:3) ; 100] , S.P{1} , S.K, 'c')) 
evans(H_eq,1e6)
title('Yaw damper')
wn = [0.5 1/1.4]
zeta =[0.6 0.08]
mtlb_axis([-1.5 1 -1.5 0.5])
sgrid(zeta,wn,'black')

//Post-tuning graphical elements
ch = gca().children;
curves = ch(2).children;
curves.thickness = 2;
asymptotes = ch(ch.type=="Segs");
asymptotes.segs_color = color("grey70");

