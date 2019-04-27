function [Ypreds, MMs, MCovs] = run_mgcs(Xtrain, Ytrain, Xtest, epsilon, L)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar parameter for regularisation (double)
%   L      : scalar (integer) of the number of Gaussian distributions per class
% Output:
%  Ypreds : N-by-1 matrix of predicted labels for Xtest (integer)
%  MMs     : (L*K)-by-D matrix of mean vectors (double)
%  MCovs   : (L*K)-by-D-by-D 3D array of covariance matrices (double)

    K = max(Ytrain) + 1;
    
    [M, D] = size(Xtrain);
    [N, D] = size(Xtest);
    
    % Initalise the output matrices
    Ypreds = zeros(N,1);
    MMs = zeros(L*K, D);
    MCovs = zeros(L*K, D, D);
    
    % initalise the posterior probability matrix
    pp = zeros(N,K,L);
    
    % Iterate through each class
    for k=1:K
        class_vec = Xtrain(Ytrain == k-1, :);
        [C, idx, SSE] = my_kMeansClustering(class_vec, L, class_vec(1:L,:));
        prior = log(length(find(Ytrain == k-1))) / M;
        
        for l=1:L % iterate through each cluster
            cluster_vec = class_vec(idx==l, :);
            
            % compute the mean
            mean_vec = MyMean(cluster_vec);
            MMs((k-1)*L + l,:) = mean_vec;
            
            % compute and regularise the covariance
            covariances = MyCov(cluster_vec);
            I = eye(D);
            regularised = covariances + epsilon*I;
            MCovs((k-1)*L + l, :, :) = regularised;
            
            % compute the log likelihood
            lik_k = gaussianMV(mean_vec, regularised, Xtest);
            pp(:, k, l) = lik_k + log(prior);
        end
    end
    class_pp = max(pp, [], 3);
    [~, Ypreds] = max(class_pp, [], 2);
    Ypreds = Ypreds - 1;
    
end
