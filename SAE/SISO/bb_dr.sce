clear
exec('dados/dinamica.sce',-1)
A = A(1:4,1:4)
B = B(1:4,:)

// bb/dr
H1 = syslin('c',A,B(:,2),[1 0 0 0])


clf()
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




