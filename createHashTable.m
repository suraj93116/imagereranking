function [H W] = createHashTable(K,b,t)
%% function [H W] = createHashTable(K,b,t)
%  Create a hash table for kernelized LSH.
%
%  Inputs: K (kernel matrix)
%          b (number of bits)
%          t (number of Gaussian approximation elements)
%
%  Outputs: H (hash table over elements of K, size p x b)
%           W (weight matrix for computing hash keys over queries, size p x b)
%%

[p,p] = size(K);
if nargin < 3
    t = min(floor(p/4), 30);
end
K_half = K^(1/2);

%create indices for the t random points for each hash bit
%then form weight matrix
for i = 1:b
    rp = randperm(p);
    I_s(i,:) = rp(1:t);
    e_s = zeros(p,1);
    e_s(I_s(i,:)) = 1;
    W(:,i) = K_half*((1/t)*e_s - (1/p)*ones(p,1));
end
H = (K*W)>0;
W = real(W);