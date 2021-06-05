exec('dinamica.sce',-1)

A = A(1:4,1:4)
B = B(1:4,:)
C = eye(4,4)
D = zeros(4,2)

//Colocação de polos
poles(1) = -0.01
poles(2) = -0.73

wn = 0.7
zeta = 0.6

poles(3) = -wn*zeta + %i*wn*sqrt(1-zeta^2)
poles(4) = conj(poles(3))

K = ppol(A, B, poles)
