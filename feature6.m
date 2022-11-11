function [f1 f2 f3 f4 f5 f6] = feature6(z)
% This function extract features by filtering the signals through the required frequency bands
x = normalize(z); %Function to split the fault signal into 50 blocks and normalise them
y = ones(1000,50);%Preallocation for faster processing

% feature 1
[B,A]=butter(7,0.05); %Creates transfer function coeffiecient of nth order with specified cutoff frequency 
for i=1:50
  y(:,i) = filter(B,A,x(:,i)); %Filters input data using the transfer function coeffiecients
end
f1 = psd(x);  %Function to calculate the RMS value of the signal
f1 = f1';
% feature 2
[B,A]=butter(6,[0.05 0.1]);
for i=1:50
  y(:,i) = filter(B,A,x(:,i));
end
f2 = psd(y);
f2 = f2';

% feature 3
[B,A] = butter(9,[0.1 0.2]);
for i=1:50
  y(:,i) = filter(B,A,x(:,i));
end
f3 = psd(y);
f3 = f3';

% feature 4
[B,A] = butter(8,[0.2 0.4]);
for i=1:50
  y(:,i) = filter(B,A,x(:,i));
end
f4 = psd(y);
f4 = f4';

% feature 5
[B,A] = butter(9,[0.4 0.7]);
for i=1:50
  y(:,i) = filter(B,A,x(:,i));
end
f5 = psd(y);
f5 = f5';

% feature 6
[B,A] = butter(16,0.7);
for i=1:50
  y(:,i) = filter(B,A,x(:,i));
end
f6 = psd(y);
f6 = f6';


