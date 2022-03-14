
% Sparse Coefficients Optimization

D = D_0;
par.lambda     =  0.00000001;  
par.mu         =   0.00001; 
par.ro         =   1; 
par.Iter       =   1;

S_s         =   zeros( size(D,2), size(Y,2) );
A         =   zeros( size(D,2), size(Y,2) );
mu        =   par.mu;
ro        =   par.ro;
D2       =   D'*D;
DTY      =   D'*Y;
Ek        =   eye(size(D2,2));
V1        =   zeros( size(S_s) );

for  i  =  1 : par.Iter

    S_s    =    inv( D2 + mu*Ek ) * ( DTY + mu*A-V1/2 );   
    A      =    soft(S_s+V1/(2*mu), par.lambda /(2*mu));    
    mu     =    mu*ro;
    X_re   =    D*A;
end 