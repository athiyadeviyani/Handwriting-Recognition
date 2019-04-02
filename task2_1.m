%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain
    tic;
    Ypreds = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);
    toc;
    
    [N, D] = size(Xtest);
    
    for i=1:length(Ks)
        
        k = Ks(i);
        
        % Confusion matrix and accuracy, K = 10
        [CM, acc] = comp_confmat(Ytest, Ypreds(:,i), 10);
        
        % save each confusion matrix as 'task2_1_cmk.mat'
        save(strcat('task2_1_cm', num2str(k), '.mat'), 'CM');
        
        % Display k, N, Nerrs, and acc
        fprintf('Number of nearest neighbors (k) = %d\n', k);
        fprintf('Number of test samples (N) = %d\n', N);
        fprintf('Number of wrongly classified test samples (Nerrs) = %.4f\n', (N * (1-acc)));
        fprintf('Accuracy (acc) = %.4f\n', acc);
        
        
    end
    
end
