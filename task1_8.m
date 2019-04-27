%
%
function allSSEs = task1_8(X)
%  NB: there is no specification to this function.
    

    
    % change the number of cluster centres
    
    maxIter = 100;
    
    allSSEs = zeros(11,11);
    
    % 1 cluster centre
    fprintf('1 CLUSTER CENTRE\n');
    no_cc = 1;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
        
    end
    fprintf('---------------------------------------\n');
    
    % 2 cluster centres
    fprintf('2 CLUSTER CENTRES\n');
    no_cc = 2;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
    
    % 3 cluster centres
    fprintf('3 CLUSTER CENTRES\n');
    no_cc = 3;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
    
    % 4 cluster centres
    fprintf('4 CLUSTER CENTRES\n');
    no_cc = 4;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
    
    % 5 cluster centres
    fprintf('5 CLUSTER CENTRES\n');
    no_cc = 5;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
    
    % 6 cluster centres
    fprintf('6 CLUSTER CENTRES\n');
    no_cc = 6;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
    
    % 7 cluster centres
    fprintf('7 CLUSTER CENTRES\n');
    no_cc = 7;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
    
    % 8 cluster centres
    fprintf('8 CLUSTER CENTRES\n');
    no_cc = 8;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
    
    % 9 cluster centres
    fprintf('9 CLUSTER CENTRES\n');
    no_cc = 9;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
    
    % 10 cluster centres
    fprintf('10 CLUSTER CENTRES\n');
    no_cc = 10;
    for i=1:10
        Cs = X(i:i+(no_cc-1),:);
        [C, idx, SSE] = my_kMeansClustering(X, no_cc, Cs, maxIter);
        fprintf('ranges: %d - %d\n', i, i+(no_cc-1));
        fprintf('SSE: %.4f\n', SSE(maxIter+1));
        allSSEs(1,no_cc) = no_cc;
        allSSEs(i+1,no_cc) = SSE(maxIter+1);
    end
    fprintf('---------------------------------------\n');
 
    
    % saves the SSE matrix for analysis
    save('task1_8_SSEs.mat', 'allSSEs');
    
end

