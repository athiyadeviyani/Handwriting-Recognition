function [CM, acc] = comp_confmat(Ytrues, Ypreds, K)
% Input:
%   Ytrues : N-by-1 ground truth label vector
%   Ypreds : N-by-1 predicted label vector
% Output:
%   CM : K-by-K confusion matrix, where CM(i,j) is the number of samples whose target is the ith class that was classified as j
%   acc : accuracy (i.e. correct classification rate)
    
    % Initalise CM
    CM = zeros(K,K);
   
    [N, ~] = size(Ytrues);
    
    % populate the confusion matrix by iterating through K 
    for k=1:K
       preds = Ypreds(Ytrues == k-1);
       preds = preds';
       for p = preds
           tmp = CM(k, p+1) + 1;
           CM(k, p+1) = tmp;
       end
    end
    
    % get the accuracy
    acc = trace(CM) / N;
   
end
