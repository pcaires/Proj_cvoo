clear
exec('dinamica.sce',-1)
[wn,z] = damp(syslin('c',A,B,C,D))



p1 = [wn(1) z(1)] // integrador
p2 = [wn(2) z(2)] // espiral estável (nível 1) 
p3 = [wn(3) z(3)] // RH
p4 = [wn(4) z(4)] // RH
p5 = [wn(5) z(5)] // rolamento

n1_RH = (p2(1)>0.5) && (p2(2)>0.08) && (p2(1)*p2(2)>0.15) //False nivel 2

n1_R = 1/p5(1)<1.4 //False nivel 2

//Globalmente nivel 2



s = poly(0,'s')


// Função de transeferencia entrada em dr e saida em r
C = [0 0 1 0 0]
H = C*inv(s*eye(5,5)-A)*B(:,2)


wn = [0.5 1/1.4]
zeta =[0.6 0.08]


figure(1)
clf();
[Ki,s]=kpure(-H) // Gains that give pure imaginary closed loop poles
evans(-H,Ki*1.2);
sgrid(zeta,wn)
plot([real(s) real(s)],[imag(s) -imag(s)],'*r')
plot([-0.15 -0.15],[-1 1],'--k')
set(gca(),"grid",[1 1])


//figure(2)
//clf();evans(H,30);
//sgrid()
//[Ki,s]=kpure(H) // Gains that give pure imaginary closed loop poles
//plot([real(s) real(s)],[imag(s) -imag(s)],'*r')

//[Kr,s]=krac2(H)
