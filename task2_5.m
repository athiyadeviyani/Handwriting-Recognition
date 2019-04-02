%
%
function task2_5(Xtrain, Ytrain, Xtest, Ytest, epsilon)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  epsilon : a scalar variable (double) for covariance regularisation
    
    % calls the classification function with epsilon 0.01
    % Measures the user time taken for the classification experiment, and
    % display the time (in seconds) to the standard output
    tic;
    [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon);
    toc;
    
    % obtains the confusion matrix, stores it to a matrix variable cm, and
    % saves it with the file name 'task2_5_cm.mat'
    K = max(Ytrain) + 1;
    [cm, acc] = comp_confmat(Ytest, Ypreds, K);
  
    save('task2_5_cm.mat','cm');
    
    % copy the mean vector and covariance matrix for Class 10
    % i.e. Ms(10,:) and Covs(10,:,:) to new variables, M10 and Cov10
    M10 = Ms(10,:);
    Cov10 = Covs(10,:,:);
    
    % save them as 'task2_5_m10.mat' and 'task2_5_cov10.mat' 
    save('task2_5_m10.mat', 'M10');
    save('tsak2_5_m10.mat', 'Cov10');
    
    % Display the required information to the standard output
    [N, D] = size(Xtest);
    
    fprintf('Number of test samples (N) = %d\n', N);
    fprintf('Number of wrongly classified test samples (Nerrs) = %.4f\n', (N * (1-acc)));
    fprintf('Accuracy (acc) = %.4f\n', acc);
end
