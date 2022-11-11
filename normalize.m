function [x] = normalize(y)
%This function take defect signals as input, split each of them into 50
%non-overlapping blocks, and returns the normalised data for them.
x = reshape(y,1000,[]);
for i=1:50
    x(:,i)= x(:,i) - mean(x(:,i)); 
end

