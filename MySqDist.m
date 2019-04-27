function D = MySqDist(a,b)
    D = bsxfun(@plus, dot(a,a,2), dot(b,b,2)')-2*(a*b');
end
