function [ G ] = gradient( h, w )
%GRADIENT Summary of this function goes here
%   Detailed explanation goes here
gdim = h*(w-1)+w*(h-1);

% collect triplets here
i = [(1:gdim)'; (1:gdim)'];
a = [1:w*h]; a(h:h:w*h)=[]; 
b = [h+1:w*h];
c = [1:w*h]; c(1:h:w*h)=[];
d = [1:h*(w-1)];
j = [a';b';c';d'];
v = [(1/2)*ones(gdim,1); -(1/2)*ones(gdim,1)];

G = sparse(i,j,v);


