exec('dados/dinamica.sce',-1)
A = A(1:4,1:4)
B = B(1:4,:)
C = eye(4,4)
D = zeros(4,2)

// SISO com yaw damper (r/dr)
draw_rloc = 0

// Yaw damper (r/dr)
H1 = syslin('c',A,B(:,2),[0 0 1 0])

if draw_rloc then
    scf(0)
    clf()
    H1 = (-1)*H1 //Root locus para ganhos negativos/ realimentação positiva 
    evans(H1,100)
    
    title('Yaw damp')
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
    xs2svg(gcf(), 'res/YawDamp');
end

K1 = -48
A1 = A-B*[zeros(1,4); 0 0 K1 0]

// p/da
H1 = syslin('c',A1,B(:,1),[0 1 0 0])

if draw_rloc then
    scf(1)
    clf()
    H1 = (-1)*H1 //Root locus para ganhos negativos/ realimentação positiva 
    evans(H1,0.06)
    
    title('p/da após Yaw Dampner')
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
    xs2svg(gcf(), 'res/p_da');
end

K2 = -0.00323
K_SISO = [0 K2 0 0; 0 0 K1 0]
A2 = A-B*K_SISO
if draw_rloc then
    P = syslin('c',A2,B,C)
    [wn,z] = damp(P)
    disp(wn)
    disp(z)
    scf(2)
    time = [0:0.1:100]
    Sl = ss2tf(P)(:,1)
    
    Y = csim('impulse',time,Sl*deg)
    plot(time,Y')
    //x = [ bb; p; r; phi; psi]
    legend('bb','p','r','phi')
    xgrid(1)

end


