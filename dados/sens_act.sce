//Sensores e Atuadores

//Atuadores
damax = 18 //deg 
drmax = 23 //deg
damax = damax* %pi/180
drmax = drmax* %pi/180

Ta = 100e-3 //s
v_max = 1 // rad/s
rate = 100 //Hz
rate = 1/rate //s 

//Sensores
bb_s = 25 //saturation deg
bb_s = bb_s* %pi/180 // rad
bb_t = 0.01 //tempo s
bb_r = 5 //range Vdc
bb_n = 0.25 //range deg
bb_n = bb_n* %pi/180 // rad

pr_s = 50 //saturation deg/s
pr_s = pr_s* %pi/180 //rad/s
pr_r = 3 //range +- Vdc
pr_n = 2e-3 //noise V RMS

phi_s = 90 //saturation deg
phi_s = phi_s* %pi/180
phi_r = 28 //range Vdc
phi_n = 0.25 // deg RMS
phi_n = phi_n* %pi/180 //rad RMS

psi_s = 360 // saturation deg
psi_s = psi_s* %pi/180 // rad
psi_r = 25 // range Vdc
psi_n = 1.5 //noise deg RMS
psi_n = psi_n* %pi/180 //rad RMS
