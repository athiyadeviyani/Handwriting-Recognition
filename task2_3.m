%
%
function task2_3(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector for X (unit8)

    
    k = max(Y) + 1;
    
    % load eigenvectors and eigenvalues of X
    [EVecs, EVals] = comp_pca(X);
    
    % Transform X to the data in the 2D space spanned by the first two
    % principal components
    PCA = EVecs(:,(1:2));
    x = X * PCA;
    
    for i=1:k
        vecs = x(Y == (i-1), :);
        mean_vector = MyMean(vecs);
        covar_m = MyCov(vecs);
        
        [evecs, evals] = eig(covar_m);
        sd = sqrt(evals); 
        
        % plot the contour of the distribution of each class using the
        % plot() function
        
        % DO NOT USE CONTOUR()
        xlabel('1st principal component');
        ylabel('2nd principal component');

        t = linspace(0, 2 * pi);
        a = (evecs * sd) * [cos(t(:))'; sin(t(:))'];
        
        plot(a(1,:) + mean_vector(1), a(2, :) + mean_vector(2));
        hold on;
    end
    
end
