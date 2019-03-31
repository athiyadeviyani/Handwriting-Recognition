%
%
function task1_4(EVecs)
% Input:
%  Evecs : the same format as in comp_pca.m
    vectors = zeros(28, 28, 10);
    for i=1:10
        vector = reshape((EVecs(:,i))*255.0, 28, 28)';
        vectors(:,:,i) = vector;
    end
    figure;
    montage(vectors);


end
