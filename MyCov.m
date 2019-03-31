function covar_m = MyCov(X)

    [N, D] = size(X);
    
    % no. of observations = N
    
    % Subtract off mean for each dimension
    X_mean = MyMean(X);
    
    % mean shift
    X_shift = bsxfun(@minus, X, X_mean);
    
    % compute covariance matrix
    covar_m = 1 / (N) * (X_shift' * X_shift);
end

    