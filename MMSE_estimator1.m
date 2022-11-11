load('encoder.mat') %Loading the encoder value
sigma = sqrt(9);    %Sigma = square root of variance
y = encoder(1:5);   %Selecting the first 100 sensor observations as the input. This can be varied
y_sum = sum(y);     %Calculating the sum of the sensor values
T = length(y);      %Number of observations
% y_sum = 0;
% T = 1*10^-7;
%The following 2 functions represents the function that needs to be 
%integrated in the numerator and denominator of the MMSE estimator equation
f_num = @(x) (x/sqrt(2.*pi.*(sigma.^2)/T)).*exp((-1/(2.*(sigma.^2)/T)).*(x - (y_sum/T)).^2);    
f_den = @(x) (1/sqrt(2.*pi.*(sigma.^2)/T)).*exp((-1/(2.*(sigma.^2)/T)).*(x - (y_sum/T)).^2);
%The following 2 integrals represents the numerator and denominator of the
%MMSE estimator equation
n = integral(f_num,0,30);
d = integral(f_den,0,30);
x_exp = (n/d);      %The MMSE estimator
%Displaying the MMSE estimator
disp(['the estimated measurement = ',num2str(x_exp), newline, 'mean= ', num2str(mean(y))])