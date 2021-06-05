exec('dados/dinamica.sce',-1)
A = A(1:4,1:4)
B = B(1:4,:)
C = eye(4,4)
D = zeros(4,2)

// SISO com ARI(r/da) e bb/dr
draw_rloc = 0

// ARI  (r/da)
H1 = syslin('c',A,B(:,1),[0 0 1 0])

if draw_rloc then
    scf(0)
    clf()
    H1 = (-1)*H1 //Root locus para ganhos negativos/ realimentação positiva 
    evans(H1,100)
    
    title('ARI')
    wn = [0.5 1/1.4]
    zeta =[0.6 0.08]
    mtlb_axis([-.8 .1 -2 2])
    sgrid(zeta,wn,'black')
    xgrid()
    //Post-tuning graphical elements
    ch = gca().children;
    curves = ch(2).children;
    curves.thickness = 2;
    asymptotes = ch(ch.type=="Segs");
    asymptotes.segs_color = color("grey70");
    
    //Guardar figura
    xs2svg(gcf(), 'res/ARI');
end

K1 = -.275
A1 = A-B*[0 0 K1 0;zeros(1,4)]

// bb/dr
H1 = syslin('c',A1,B(:,2),[1 0 0 0])

if draw_rloc then
    scf(1)
    clf()
    H1 = (-1)*H1 //Root locus para ganhos negativos/ realimentação positiva 
    evans(H1,1000)
    
    title('bb/dr após ARI')
    wn = [0.5 1/1.4]
    zeta =[0.6 0.08]
    //mtlb_axis([-.8 .1 -2 2])
    sgrid(zeta,wn,'black')
    xgrid()
    
    //Post-tuning graphical elements
    ch = gca().children;
    curves = ch(2).children;
    curves.thickness = 2;
    asymptotes = ch(ch.type=="Segs");
    asymptotes.segs_color = color("grey70");
    
    //Guardar figura
    xs2svg(gcf(), 'res/bb_dr');
end

K2 = -735
K_SISO = [0 0 K1 0; K2 0 0 0]
A2 = A-B*K_SISO



