load('encoder.mat') %Loading the encoder value
mu_prior = 15;          %Mean of prior knowledge gaussian distribution
sigma_prior = sqrt(4);  %Sigma of prior knowledge gaussian distribution = square root of variance
sigma = sqrt(9);        %Sigma of the noise
y = encoder(1:100);     %Selecting the first 100 sensor observations as the input. This can be varied
y_sum = sum(y);         %Calculating the sum of the sensor values
T = length(y);          %Number of observations
% y_sum = 0;
% T = 0;
%The following 2 functions represents the numerator and denominator of the MMSE estimator equation
num = ((1/sigma.^2).*y_sum)+ (mu_prior/sigma_prior.^2);
den = (T/sigma.^2) + (1/sigma_prior.^2);
x_exp = num/den;        %The MMSE estimator
%Displaying the MMSE estimator
disp(['the estimated measurement = ',num2str(x_exp), newline, 'mean= ', num2str(mean(y))])