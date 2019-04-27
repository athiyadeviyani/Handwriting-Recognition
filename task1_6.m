%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
% 

    % Gets the cluster centres
    C = importdata(MAT_ClusterCentres);
    [row, ~] = size(C);
    vectors = zeros(28, 28, row);
    
    for i=1:row
        vector = reshape(C(i,:), 28, 28)';
        vectors(:,:,i) = vector;
    end
    montage(vectors);
  
end
