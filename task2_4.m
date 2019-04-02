%
%
function [Corrs] = task2_4(Xtrain, Ytrain)
% Input:
%  Xtrain : M-by-D data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for X
% Output:
%  Corrs  : (K+1)-by-1 vector (double) of correlation $r_{12}$ 
%           for each class k = 1,...,K, and the last element holds the
%           correlation for the whole data, i.e. Xtrain.

    % Check lab 2 for correlation coefficient calculation!
    K = max(Ytrain)+1;
    
    Corrs = zeros(K+1, 1);
    
    % gets 2D-PCA
    [EVecs, EVals] = comp_pca(Xtrain);
    PCA = EVecs(:,(1:2));
    x = Xtrain * PCA;
    
    for i = 1:K
        vecs = x(Ytrain == (i-1), :);
       
        covar_m = MyCov(vecs);
        
        var_x = covar_m(1,1);
        var_y = covar_m(2,2);
        cov_xy = covar_m(1,2);
        
        Corrs(i) = cov_xy/sqrt(var_x*var_y);
        
    end
    
    covar_m = MyCov(x);

    var_x = covar_m(1,1);
    
    var_y = covar_m(2,2);
    
    cov_xy = covar_m(1,2);
   
    Corrs(11) = cov_xy/sqrt(var_x*var_y);
    save('task2_4_corrs.mat', 'Corrs');
end
