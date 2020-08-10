function Tgo  = tgo_interception(r,v,drho,m,minTgo)
% this function calculates  the Tgo for the interception guidance.

Tgo = 500;
if Tgo > minTgo
    tgoroots = roots([drho^2/4 0  -norm(v)^2+m*drho -2*r*v.' -norm(r)^2+m^2]);
    tgorsol =  tgoroots(abs(imag(tgoroots)) <0.000000001 & real(tgoroots) >= 0);
    tgo4 = min(real(tgorsol));
    if tgo4 > 500
        tgo4 = 500;
    end
else
    tgo4 = minTgo;
end
    Tgo = tgo4;
