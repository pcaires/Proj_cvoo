clear
exec('dados/dinamica.sce',-1)
A = A(1:4,1:4)
B = B(1:4,:)

// p/da
H1 = syslin('c',A,B(:,1),[0 1 0 0])

H1 = (-1)*H1 //Root locus para ganhos negativos/ realimentação positiva 
evans(H1,.5)

title('p/da')
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


//Escolha do ganho
k = 0.006

// Plot dos polos do anel fechado
//S = zpk(H1/(1+k*H1))
//p = S.P{1}
//for j=1:1:length(p)
//    plot(real(p(j)),imag(p(j)),'r+','MarkerSize',15)
//end

//Display dos polos
disp("polos do anel fechado:")
disp(p)




