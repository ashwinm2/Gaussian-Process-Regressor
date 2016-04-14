function C = msd(a, b)

if nargin<1  || nargin>3 || nargout>1, error('Wrong number of arguments.'); end
bsx = exist('bsxfun','builtin');     
if ~bsx, bsx = exist('bsxfun'); end      
[D, n] = size(a);

  [d, m] = size(b);
  if d ~= D, error('Error: column lengths must agree.'); end
  mu = (m/(n+m))*mean(b,2) + (n/(n+m))*mean(a,2);
  if bsx
    a = bsxfun(@minus,a,mu); b = bsxfun(@minus,b,mu);
  else
    a = a - repmat(mu,1,n);  b = b - repmat(mu,1,m);
  end

if bsx                                               % compute squared distances
  C = bsxfun(@plus,sum(a.*a,1)',bsxfun(@minus,sum(b.*b,1),2*a'*b));
else
  C = repmat(sum(a.*a,1)',1,m) + repmat(sum(b.*b,1),n,1) - 2*a'*b;
end
C = max(C,0);          % numerical noise can cause C to negative i.e. C > -1e-14
