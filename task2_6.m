%
%
function Dmap = task2_6(X, Y, epsilon, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X        : M-by-D data matrix (double)
%  Y        : M-by-1 label vector (uint8)
%  epsilon  : scalar (double) for covariance matrix regularisation
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec   : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) denoting the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

    EVecs = importdata(MAT_evecs);
    EVals = importdata(MAT_evals);

    
    % Principal Axes
    PCA1 = EVecs(:,(1:2));
    PCA2 = PCA1';
    
    
    % Standard deviations
    sd1 = sqrt(EVals(1,:));
    sd2 = sqrt(EVals(2,:));
    
    % Compute the mean
    x = (X - posVec) * PCA1;
    
    means = MyMean(x);
    
    mean1 = means(1);
    mean2 = means(2);
    
    % Set the plotting range
    Xplot = linspace(mean1 - (5 * sd1), mean1 + (5 * sd1), nbins)';
    Yplot = linspace(mean2 - (5 * sd2), mean2 + (5 * sd2), nbins)';
    
    % Initialise Dmap
    Dmap = zeros(nbins, nbins);
    
    [Xv, Yv] = meshgrid(Xplot, Yplot);
    gridX = [Xv(:), Yv(:)];
    
    
    % Calculate the distances
    Dmap = run_gaussian_classifiers(x, Y, gridX, epsilon);
    
    Dmap = reshape(Dmap, nbins, nbins);
   
  
    
    % save Dmap
    filename = strcat('task2_6_dmap.mat');
    save(filename, 'Dmap');
    
    % Draw the decision boundaries
    figure;
    contourf(Xplot, Yplot, Dmap, 'edgecolor','none');
end
