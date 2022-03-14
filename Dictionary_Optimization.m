
% Spectral Dictionary Optimization

S  = zeros(size(D_0));
V1 = zeros(size(D_0));
mu         =  100; 
eta        =  0.001;

for  i  =  1 : par.Iter    
    S = ( Y*A' + mu*( D_0 - V1/(2*mu)) ) * inv( A*A' + mu * eye(size(A,1)));
    [u s v]  = svd(S + V1/(2*mu));
    s_s = soft(s, eta/(2*mu));
    D   =  u *s_s *v';
    V1  =  V1 + mu*( S - D );
    X_reL = D * A;
end 