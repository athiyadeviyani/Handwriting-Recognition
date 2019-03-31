%
% by Hiroshi Shimodaira, March 2019
%
% How to use this function:
%  On the Matlab Command window, type the following after you replace
%  <UUN> with your UUN.
% >> dset_dir = '/afs/inf.ed.ac.uk/group/teaching/inf2b/cwk2/d/s1709906';
% >> [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dset_dir);
% >> Xrrn = double(Xtrn)/255.0;
% >> Xtst = double(Xtst)/255.0;
% >> disp_one(Xtrn, Ytrn);
%

function disp_one(X, Y)
  colormap 'gray';
  for i = 1:size(X,1)
    image( reshape(X(i,:)*255.0, 28, 28)' );
    % imshow( reshape(X(i,:), 28, 28)' );
    disp(sprintf('%d ', Y(i)));
    k = input('Hit return: ', 's');
    if k == 'q'
      break
    end
  end
end
