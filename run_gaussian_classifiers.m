function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.

    % Gets the number of classes
    K = max(Ytrain) + 1;
    
    % Gets the matrix sizes
    [M, D] = size(Xtrain);
    [N, D] = size(Xtest);
    
    % Initialise the output matrices
    Ypreds = zeros(N,1);
    Ms = zeros(K,D);
    Covs = zeros(K,D,D);
    
    % To get the predicted classes, compute the posterior probabilities for
    % the test samples
    % pp is posterior probability
    pp = zeros(N, K);
    
    % Compute the means and variances
    for k=1:K
        k_training_samples = Xtrain(Ytrain == k-1, :);
        
        
        % Ms(k,:) is the sample mean vector for class k
        mean_vec = MyMean(k_training_samples);
        Ms(k,:) = mean_vec;
        
        covariances = MyCov(k_training_samples);
        
        % REGULARISATION: add a epsilon to the diagonal elements of the covariance matrix
        % i.e. cov <- cov + e*I where I is the identity matrix
        I = eye(D);
        regularised = covariances + epsilon*I;
        
        % Covs(k,:,:) is the covariance matrix (after the regularisation)
        % for class k
        Covs(k,:,:) = regularised;
        
        % Compute the log likelihood --> LAB 7

        lik_k = gaussianMV(mean_vec, regularised, Xtest);
        prior = length(find(Ytrain == k-1))/length(Xtrain);
        pp(:,k) = lik_k + log(prior);
    end
    
    
    
    % Append test sample to the class that has the highest posterior
    % probability
    
    [~, Ypreds] = max(pp, [], 2);
    Ypreds = Ypreds - 1;
    
    
end
