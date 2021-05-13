g = 9.81 // m*s^-2

aa0 =7.17 //deg
u0 =261.4 //kn
u0 = u0*0.51444444444 // m*s^-1
tt0 = aa0

m =13054 //kg
Ix =606886 //kg .m ^2
Iy =105563 //kg .m ^2
Iz =632778 //kg .m ^2
Ixz =2034  //kg .m ^2

//I_x = (Ix*Iz-Ixz^2)/Iz
//I_z = (Ix*Iz-Ixz^2)/Ix
//I_xz = Ixz/(Ix*Iz-Ixz^2)

ybb = -0.2289
lbb = -0.3440
nbb = 1.3196
yp = 0.0010
lp = -0.5551
np = 0.0042
yr = 0.0042
lr = -0.0585
nr = -0.0737

Lda = -30.698
Nda = -0.249
Yda = 0
Ydr = -0.003
Ldr = -0.016
Ndr = -0.051


yv = ybb/u0
lv = lbb/u0
nv = nbb/u0

l_v = lv + Ixz/Ix*nv
n_v = nv + Ixz/Iz*lv

l_p = lp + Ixz/Ix*np
l_r = lr + Ixz/Ix*nr
n_p = np + Ixz/Iz*lp
n_r = nr + Ixz/Iz*lr

L_da = Lda + Ixz/Ix*Nda
L_dr = Ldr + Ixz/Ix*Ndr
N_da = Nda + Ixz/Iz*Lda
N_dr = Ndr * Ixz/Iz*Ldr


//x = [ v; p; r; phi; psi]


A = [ybb yp+aa0 yr-1          g*cosd(tt0)/u0   0;
     l_v l_p    l_r           0                0;
     n_v n_p    n_r           0                0;
     0   1      tand(tt0)     0                0;
     0   0      1/cosd(tt0)   0                0]

//u = [da; dr]

B = [Yda   Ydr;
     L_da L_dr;
     N_da N_dr;
     0    0;
     0    0]

C = eye(3,3)
D = zeros(3,2)
