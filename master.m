%tic;
%Loading all the files and assigning them to variables
load('resonance.mat')
load('bearing.mat')
load('imbalance.mat')
load('misalignment.mat')
load('gearmesh.mat')

%Feature extraction for each faults. functions6 returns the features for the 50 blocks of data
[f1 f2 f3 f4 f5 f6] = feature6(bearing);
fault1 =[f1,f2,f3,f4,f5,f6];

[f1 f2 f3 f4 f5 f6] = feature6(gearmesh);
fault2 =[f1,f2,f3,f4,f5,f6];

[f1 f2 f3 f4 f5 f6] = feature6(resonance);
fault3 =[f1,f2,f3,f4,f5,f6];

[f1 f2 f3 f4 f5 f6] = feature6(imbalance);
fault4 =[f1,f2,f3,f4,f5,f6];

[f1 f2 f3 f4 f5 f6] = feature6(misalignment);
fault5 =[f1,f2,f3,f4,f5,f6];

%Combining all the fault features into a single dataset G
G=[fault1;fault2;fault3;fault4;fault5];

%PCA analysis
c=corrcoef(G); % Calculates a correlation coefficient matrix c of G
[v,d] =eig(c); % Find the eigenvectors v and the eigenvalues d of G
T=[ v(:,end)';v(:,end-1)']; % Create the transformation matrix T from the first two principal components
z=T*G'; % Create a 2-dimensional feature vector z
%Plotting the 2-dimensional features
figure
hold on
plot(z(1,1:50),z(2,1:50),'ro')
plot(z(1,51:100),z(2,51:100),'b+')
plot(z(1,101:150),z(2,101:150),'c^')
plot(z(1,151:200),z(2,151:200),'ks')
plot(z(1,201:250),z(2,201:250),'md')
title('Visualisation of faults')
legend('Bearing fault','Gearmesh fault','Resonance','Imbalance','Misalignment')
%toc;