//chdir("C:\Users\Pedro\Desktop\MEAer\3a2s\CVoo\projeto\Proj_cvoo")
exec('SAE/MIMO/seguimento.sce',-1)

A = [A zeros(4,1) ;0 0 1/cos(tt0) 0 0]
B = [B;0 0]
C = eye(5,5)
D = zeros(5,2)

K_MIMO = [K_MIMO zeros(2,1)]


ws = 10 //ms^-1 (N -> S) 
