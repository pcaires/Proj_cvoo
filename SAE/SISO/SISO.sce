clear
exec('dados/dinamica.sce',-1)
A = A(1:4,1:4)
B = B(1:4,:)

// SISO com ARI(r/da) e bb/dr

// ARI  (r/da)
H1 = syslin('c',A,B(:,1),[0 0 1 0])

H1 = (-1)*H1 //Root locus para ganhos negativos/ realimentação positiva 
evans(H1,100)

title('ARI')
wn = [0.5 1/1.4]
zeta =[0.6 0.08]
mtlb_axis([-.8 .1 -2 2])
sgrid(zeta,wn,'black')

//Post-tuning graphical elements
ch = gca().children;
curves = ch(2).children;
curves.thickness = 2;
asymptotes = ch(ch.type=="Segs");
asymptotes.segs_color = color("grey70");

K1 = -.275
A1 = A-B*[0 0 K1 0;zeros(1,4)]


// bb/dr
H1 = syslin('c',A1,B(:,2),[1 0 0 0])

H1 = (-1)*H1 //Root locus para ganhos negativos/ realimentação positiva 
evans(H1,1000)

title('bb/dr')
wn = [0.5 1/1.4]
zeta =[0.6 0.08]
//mtlb_axis([-.8 .1 -2 2])
sgrid(zeta,wn,'black')

//Post-tuning graphical elements
ch = gca().children;
curves = ch(2).children;
curves.thickness = 2;
asymptotes = ch(ch.type=="Segs");
asymptotes.segs_color = color("grey70");

K2 = -735
K = [0 0 K1 0; K2 0 0 0]
A2 = A-B*K

spec(A2)



