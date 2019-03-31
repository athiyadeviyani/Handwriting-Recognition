%
%
function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
% Input:
%  X : M-by-D data matrix (double)
% Output:
%  EVecs, Evals: same as in comp_pca.m
%  CumVar  : D-by-1 vector (double) of cumulative variance
%  MinDims : 4-by-1 vector (integer) of the minimum number of PCA dimensions
%            to cover 70%, 80%, 90%, and 95% of the total variance.
    
    % Gets EVecs and EVals
    [EVecs, EVals] = comp_pca(X);
    
    % Cumulative Variance, D x 1 vector
    CumVar = cumsum(EVals);
    
    % Plots the cumulative variance
    figure;
    
    plot(CumVar);
    hold on;
    xlabel('Number of Dimensions');
    ylabel('Cumulative Variance');
    title('Cumulative Variances');
    grid on;
    
    % Find the minimum number of PCA dimensions to cover 70%, 80%, 90%, 95%
    total = sum(EVals);
    CVRatio = CumVar / total;
    
    MinDims = zeros(4,1);
    
    for i=1:length(CVRatio)
        val = CVRatio(i);
        if val >= 0.95 && MinDims(4,1) == 0
            MinDims(4,1) = i;
        end
        if val >= 0.90 && MinDims(3,1) == 0
            MinDims(3,1) = i;
        end
        if val >= 0.80 && MinDims(2,1) == 0
            MinDims(2,1) = i;
        end 
        if val >= 0.70 && MinDims(1,1) == 0
            MinDims(1,1) = i;
        end
    end
            
end
