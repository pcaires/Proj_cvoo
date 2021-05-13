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
Ydr = -0.003
Ldr = -0.016
Ndr = -0.051

//x = [ bb; p; r]

A = [ybb yp yr; lbb lp lr; nbb np nr]

//u = [da; dr]
B = [0 Ydr; Lda Ldr; Nda Ndr]


