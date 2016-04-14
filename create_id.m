function id = create_id(kxx)
%   The function computes an identity matrix of size [m,n]
%   The input parameter passed is the K(xx)
[m,n] = size(kxx);
id = eye (m,n);
end
