%
%
function M = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.
    [M, D] = size(X);
    % initialize M
    M = zeros(11, D);
        
    vectors = zeros(28, 28, 11);
    
    for k=0:9
        
        indexes = find(Y == k);
        
        classMean = MyMean(X(indexes,:));
        M(k+1,:) = classMean;
    end
    
    M(11,:) = MyMean(X);
    
    for i=1:11
        classvector = reshape(M(i,:), 28, 28)';
        vectors(:,:,i) = classvector;
    end
    figure
    montage(vectors);
end
