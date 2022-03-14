function [ anomaly_map ] = Optimization_coefficient( Y , D_0, X)
    % compute sparse coefficient
    ADMM_Coefficients;
    % error matrix and output
    err_2 = mean(abs(X_re - Y),1);
    err_2_2d = reshape(err_2,size(X,1),size(X,2));
    err_2_2d = err_2_2d - min(err_2_2d(:));
    anomaly_map = err_2_2d./max(max(err_2_2d));
end

