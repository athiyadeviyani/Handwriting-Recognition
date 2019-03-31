function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)
    
    % Initalise CM
    CM = zeros(K,K);
    
    % get sizes
    [N, ~] = size(Ytrues);
    
    % populate the confusion matrix by iterating through N
    for i=1:N
        CM(Ytrues(i), Ypreds(i)) = CM(Ytrues(i), Ypreds(i)) + 1;
    end
    
    
    % compute the accuracy
    total = 0;
    
    for i=1:max(unique(Ytrues))
        total = total + CM(i,i);
    end
    
    acc = total/N;
    
    
end
