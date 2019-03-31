%
%
function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours
    for i = 1:length(Ks)
        k = Ks(i);
        Cs = X(1:k,:);
        tic;
        [C, idx, SSE] = my_kMeansClustering(X, k, Cs, 100);
        toc;
        % save the returned C, idx, SSE as 'task1_5_c_k.mat',
        % 'task1_5_idx_k', and 'task1_5_sse_k.mat' respetively
        
        save(strcat('task1_5_c_', num2str(k), '.mat'), 'C');
        save(strcat('task1_5_idx_', num2str(k), '.mat'), 'idx');
        save(strcat('task1_5_sse_', num2str(k), '.mat'), 'SSE');
        
        % Plot graph for each k
        figure;
        plot(SSE);
        hold on;
        grid on;
        xlabel('Iteration number');
        ylabel('SSE');
        title(strcat('SSE for k=', num2str(k)));
        
    end
    
end
