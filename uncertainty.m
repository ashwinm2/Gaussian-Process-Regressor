function confidence = uncertainty(kxstarxstar, kxxstar , cn)
%   Confidence function.
cninv = inv(cn);
trans = kxxstar';
inter = trans*cninv;
inter = inter*kxxstar;
confidence = kxstarxstar-inter;
end