%
%
function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
    for k=0:9
        
        % initialize an empty vector
        vectors = zeros(28, 28, 10);
        indexes = find(Y == k);
        
        % first 10 indexes of Ytrn for each class
        usedIndexes = indexes(1:10,:);
        
        for i=1:10
            j = usedIndexes(i);
            classvector = reshape(X(j,:), 28, 28)';
            vectors(:,:,i) = classvector;
        end
        
        % Display the images
        h = figure;
        montage(vectors);
        
        % Script to save the montage
        %MyMontage = getframe(gca);
        %classno = k+1;
        %filename = strcat('task1_1_imgs_class',num2str(classno)); 
        %imwrite(MyMontage.cdata,filename,'jpg');
    end
end

