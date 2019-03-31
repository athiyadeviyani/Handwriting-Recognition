%
%
function task1_6(MAT_ClusterCentres)
% Input:
%  MAT_ClusterCentres : file name of the MAT file that contains cluster centres C.
%       
% 
    load(MAT_ClusterCentres);
    [row, col] = size(C);
    vectors = zeros(28, 28, row);
    
    for i=1:row
        vector = reshape(C(i,:), 28, 28)';
        vectors(:,:,i) = vector;
    end
    montage(vectors);
  
end
