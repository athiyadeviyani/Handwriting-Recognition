%
%
function Dmap = task1_7(MAT_ClusterCentres, MAT_M, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  MAT_ClusterCentres: MAT filename of cluster centre matrix
%  MAT_M     : MAT filename of mean vectors of (K+1)-by-D, where K is
%              the number of classes (which is 10 for the MNIST data)
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specify the position of the plane
%  nbins     : scalar (integer) to specify the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

    
    % Import data from parameters
    Means = importdata(MAT_M);
    EVecs = importdata(MAT_evecs);
    EVals = importdata(MAT_evals);
    Centres = importdata(MAT_ClusterCentres);
    
    % Principal Axes
    PCA1 = EVecs(:,(1:2));
    PCA2 = PCA1';
    
    PC_Centres = (Centres - posVec) * PCA1;
    
    % Standard deviations
    sd1 = sqrt(EVals(1,:));
    sd2 = sqrt(EVals(2,:));
    
    % Compute the means
    mean1 = (posVec - Means(11,:)) * EVecs(:,1);
    mean2 = (posVec - Means(11,:)) * EVecs(:,2);
    
    % Set the plotting range
    Xplot = linspace(mean1 - (5 * sd1), mean1 + (5 * sd1), nbins)';
    Yplot = linspace(mean2 - (5 * sd2), mean2 + (5 * sd2), nbins)';
    
    % Initialise Dmap
    Dmap = zeros(nbins, nbins);
    
    [Xv, Yv] = meshgrid(Xplot, Yplot);
    gridX = [Xv(:), Yv(:)];
    
    % Calculate the distances
    Ds = bsxfun(@plus, dot(gridX, gridX, 2), dot(PC_Centres, PC_Centres,2)') - 2*(gridX * PC_Centres');
    [d, I] = min(Ds, [], 2);
    Dmap = reshape(I, nbins, nbins);
    
    [k, ~] = size(Centres);
    
    % If there is only one class
    if k == 1
        Dmap(1,1) = Dmap(1,1)+0.01;
    end
    
    % save Dmap
    filename = strcat('task1_7_dmap_', num2str(k), '.mat');
    save(filename, 'Dmap');
    
    % Draw the decision boundaries
    figure;
    contourf(Xplot, Yplot, Dmap, 'edgecolor','none');
    
end