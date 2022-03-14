function [ D_0 ] = Optimization_OSD( Y,D_0 )
    for i = 1 : 2
    %     Sparse Coefficients Optimization
        ADMM_Coefficients;
    %     Spectral Dictionary Optimization
        Dictionary_Optimization;
        D_0 = D;
    end

end

