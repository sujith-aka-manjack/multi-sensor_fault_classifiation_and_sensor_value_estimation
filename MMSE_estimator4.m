load('straingauge.mat')
y = straingauge;
theta = 3000;
sigma = sqrt(1);
delta_l = -20;			%Lower threshold value
delta_u = 20;			%Upper threshold value
gpos_old = 0;
gneg_old = 0;
flag = 0;
for i=1:length(y)
    gpos_new(i) = gpos_old + (y(i)-theta)/sigma;
    gneg_new(i) = gneg_old + (y(i)-theta)/sigma;
    if gpos_new(i)<0
        gpos_new(i) = 0;
    end
    if gneg_new(i)>0
        gneg_new(i) = 0;
    end
    if gpos_new(i)>delta_u
        disp(['A positive fault has been observed at time ' num2str(i)])
        flag = 1;
        %break;
    end
    if gneg_new(i)<delta_l
        disp(['A negative fault has been observed at time ' num2str(i)])
        flag = 1;
        %break;
    end
    gpos_old = gpos_new(i);
    gneg_old = gneg_new(i);
end
if flag == 0
    disp('No fault was detected')
end

% figure
% plot(y,'k')
% hold on
% plot(gpos_new+theta,'--r')
% plot(gneg_new+theta,'--b')
% plot(xlim, [1 1]*(theta+delta), ':k')
% plot(xlim, [1 1]*(theta-delta), ':k')
% xlabel('Time interval')
% ylabel('g(t)')
% hold off

figure
hold on
plot([0:20],[0 gpos_new],'--ro')
plot([0:20],[0 gneg_new],'--bo')
%plot(xlim, [1 1]*(delta), ':k')
%plot(xlim, [1 1]*0, 'k')
%plot(xlim, [1 1]*(-delta), ':k')
yline(delta_u,'-.k')
yline(0,'k')
yline(delta_l,'-.k')
xlabel('Time interval')
ylabel('g(t)')
legend('C+','C-','delta','g(t)=0')
title('CUSUM without resetting')