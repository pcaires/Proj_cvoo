function rootlocus(sys,gains,fig)
    clf(fig)
    plzr(sys)
    S = zpk(sys)
    title('Root locus')
    open_p = S.P{1}
    mtlb_axis([min(real(open_p)) max(real(open_p)) min(imag(open_p)) max(imag(open_p))])
    open_p = S.P{1}
    for k = gains
        S = zpk(sys/(1+k*sys))
        p = S.P{1}
        for j=1:1:length(p)
            //points(i,j) = p(j)
            plot(real(p(j)),imag(p(j)),'k.','MarkerSize',3)
            
        end
    end
    wn = [0.5 1/1.4]
    zeta =[0.6 0.08]
    sgrid(zeta,wn)
endfunction
