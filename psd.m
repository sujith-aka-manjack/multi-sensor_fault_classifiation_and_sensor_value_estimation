function [f] = psd(x)
%This functions takes normalised blocks of data, calculates its power
%spectral density, and calculate the RMS value
for  i=1:50
    p(:,i)=pwelch(x(:,i),[],[],[],1000); %Calculating the power spectral density
    p_norm(:,i) = norm(p(:,i)); %Calculating Euclidean distance
end
f=p_norm/sqrt(length(p));   %Calculating the RMS