function result = MyMean(v)
    [row, col] = size(v);
    
    result = zeros(1, col);
    
    for i=1:col
        colSum = sum(v(:,i));
        colMean = colSum / row;
        result(:,i) = colMean;
    end
end
        