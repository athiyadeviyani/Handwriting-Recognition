%
% A template to load the data files
%    by Hiroshi Shimodaira, March 2019.
%
%  Usage:
%
%    [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(your_dataset_directory);
%
%  where your_data_set_directory is the pathname of your coursework-data
%  directory, e.g. /afs/inf.ed.ac.uk/group/teaching/inf2b/cwk2/d/<UUN> (replace <UUN> with your UUN.)
%
function [Xtrn, Ytrn, Xtst, Ytst] = load_my_data_set(dir)
  Xtrn = rd_mnist_images(sprintf('%s/trn-images-idx3-ubyte', dir));
  Ytrn = rd_mnist_labels(sprintf('%s/trn-labels-idx1-ubyte', dir));
  Xtst = rd_mnist_images(sprintf('%s/tst-images-idx3-ubyte', dir));
  Ytst = rd_mnist_labels(sprintf('%s/tst-labels-idx1-ubyte', dir));
end

function [labels, header] = rd_mnist_labels(fname)
  fid = fopen(fname, 'r', 'ieee-be');  % MNIST uses BIG-endian
  header = fread(fid, 2, 'long');
  labels = fread(fid, Inf, 'uchar=>uchar');
  fclose(fid);
end

function [images, header] = rd_mnist_images(fname)
  fid = fopen(fname, 'r', 'ieee-be');   % MNIST uses BIG-endian
  header = fread(fid, 4, 'long=>long');	% read a header 
  n_images = header(2);
  height = header(3);
  width = header(4);

  bsize = height * width;  % byte size of an character image
% NB: MNIST pixel data of each character is stored row-wise order.
% The following code reads each block of bsize (i.e. one characer image)
% and store in an array, images[bsize][n_images], column-wise.  
  [images, count] = fread(fid, [bsize, n_images], 'uchar=>uchar');  
  images = images';  % trasponse it so that images[n_images][bsize] now.
%  printf('rd_mnist_images(%s): %d in, %d out\n', fname, n_images, count/bsize);
  fclose(fid);
end
