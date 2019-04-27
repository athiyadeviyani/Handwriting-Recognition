%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

% CHECK LAB 3 FOR REFERENCE!
  % If 'maxIter' argument is not given, we set by default to 500
  if nargin < 4
    maxIter = 500;
  end
  
  % initialize C
  C = initialCentres;
  
  % (L+1) by 1 vector where L = maxIter
  L = maxIter;
  SSE = zeros(L+1, 1); 
  [N, dim] = size(X);
  
  % D is the k x N matrix for storing distances between cluster centres and
  % observations
  % D = zeros(k, N);
  
  for i = 1:maxIter
      
      % Pairwise Euclidian Distance Vectorization
      % D = bsxfun(@plus, dot(a,a,2), dot(b,b,2)')-2*(a*b');
      % where a = X and b = C
      % D = MySqDist(a,b)
      D = MySqDist(X,C);
     
      
      % Assign data to clusters
      % Ds are the actual distances and idx are the cluster assignments
      [Ds, idx] = min(D, [], 2); % find min dist. for each observation in 2nd dimension
      
      
      % Compute the sum squared error -> mean of all the distances
      SSE(i) = MyMean(Ds);
      
      tmp = C;
      % Update cluster centres
      for c = 1:k
          % check the number of samples assigned to this cluster
          if (sum(idx==c) ~= 0)
              C(c, :) = MyMean(X(idx==c,:));
          end
      end
      
      if C == tmp
        break;
      end
      
      
  end
  D = MySqDist(X,C);
  [Ds, idx] = min(D, [], 2);
  SSE(L+1) = (1/N)*sum(Ds);
  
  
end
