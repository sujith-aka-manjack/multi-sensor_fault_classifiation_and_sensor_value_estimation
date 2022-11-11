load('encoder.mat')     %Loading the encoder value
%Calculating the estimator for the first reading alone with gaussian prior  
%as done in the last case
mu_prior = 15;          %Mean of prior knowledge gaussian distribution
sigma_prior = sqrt(4);  %Sigma of prior knowledge gaussian distribution = square root of variance
sigma = sqrt(9);        %Sigma of the noise
y = encoder(1:5);       %Selecting the first 100 sensor observations as the input. This can be varied
y_sum = y(1);           %Selecting the first reading for the initial estimator
T = 1;                  %Selecting number of observations as one.
%The following 2 functions represents the numerator and denominator of the MMSE estimator equation
num = ((1/sigma.^2).*y_sum)+ (mu_prior/sigma_prior.^2);
den = (T/sigma.^2) + (1/sigma_prior.^2);
x_old = num/den;        %The MMSE estimator for T=1
%The estimator value is updated in a sequential  manner
for i=2:length(y)
    T = i;
    %Calculating the estimator at T+1
    x_new = x_old + ((sigma_prior.^2/((T.*(sigma_prior.^2))+sigma.^2)).*(y(i) - x_old));
    %Assigning the estimator at T as T+1
    x_old=x_new;
end
%Displaying the MMSE estimator and the mean of the observations
disp(['the estimated measurement = ',num2str(x_old), newline, 'mean= ', num2str(mean(y))])