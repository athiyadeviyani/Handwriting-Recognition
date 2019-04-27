function y = gaussianMV(mu, covar, X)
    [n, d] = size(X);
    [j, k] = size(covar);
    
    invcov = inv(covar);
    mu = reshape(mu,1,d); % ensure that mu is a row vector
    
    % replicate mu and subtract from each data point
    X = X - ones(n, 1)*mu; % mean shift
    fact = sum(((X*invcov).*X),2);
    
    y = -d/2*log(2*pi)-1/2*logdet(covar)-1/2*fact;
end

